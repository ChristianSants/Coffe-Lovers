import 'package:coffelovers/controller/usuario_controller.dart';
import 'package:coffelovers/models/user.dart';
import 'package:coffelovers/pages/login_page.dart';
import 'package:coffelovers/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  var usuarioController = UsuarioController(UsuarioRepository());

  String nome = '';
  String login = '';
  String senha = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Coffe Lovers cadastro'),
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
                        nome = text;
                      },
                      decoration: InputDecoration(
                          labelText: 'Nome', border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) {
                        login = text;
                      },
                      decoration: InputDecoration(
                          labelText: 'Login', border: OutlineInputBorder()),
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
                        child: Text('Cadastrar'),
                        onPressed: () {
                          User usuario = User(
                            id: 10,
                            nome: nome,
                            login: login,
                            senha: senha,
                            cafes: [],
                          );
                          usuarioController.postUsuario(usuario);
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => LoginPage()));
                        })
                  ],
                ),
              )),
        ));
  }
}
