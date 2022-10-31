import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'cadastro_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      onChanged: (text) {
                        email = text;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) {
                        senha = text;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Senha', border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        child: Text('Entrar'),
                        onPressed: () {
                          if (email == 'coffelovers@email.com' &&
                              senha == 'cafe') {
                            print('Correto');
                          } else {
                            print('login invalido');
                          }
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
              )),
        ));
  }
}
