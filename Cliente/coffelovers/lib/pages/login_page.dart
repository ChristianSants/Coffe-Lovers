import 'dart:convert';

import 'package:coffelovers/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'cadastro_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Coffe Lovers Login'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _loginController,
                        decoration: InputDecoration(
                            labelText: 'Login', border: OutlineInputBorder()),
                        validator: (login) {
                          if (login == null || login.isEmpty) {
                            return 'Digite o seu login';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _senhaController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(),
                        ),
                        validator: (senha) {
                          if (senha == null || senha.isEmpty) {
                            return 'Digite a sua senha';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          child: Text('Entrar'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Logar();
                            }

                            /*
                            if (email == 'coffelovers@email.com' &&
                                senha == 'cafe') {
                              print('Correto');
                            } else {
                              print('login invalido');
                            }*/
                          }),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        child: Text('Cadastrar'),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => CadastroPage()),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )),
        ));
  }

  Logar() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    var url = Uri.parse('http://localhost:8080/bff/login');
    var response = await http.post(url, body: {
      'login': _loginController.text,
      'senha': _senhaController.text,
    });

    print(response.statusCode);
    print(response.body);
    if (response.body != 'false') {
      String token = response.body;
      await _sharedPreferences.setString('token', '${token}');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('login ou senha inválidos!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
