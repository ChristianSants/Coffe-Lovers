import 'package:coffelovers/controller/cafeteria_controller.dart';
import 'package:coffelovers/pages/cafeteria_page.dart';
import 'package:coffelovers/pages/home_page.dart';
import 'package:coffelovers/repository/cafeteria_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/cafeteria.dart';

class CafeteriaCadastro extends StatefulWidget {
  const CafeteriaCadastro({super.key});

  @override
  State<CafeteriaCadastro> createState() => _CafeteriaCadastroState();
}

class _CafeteriaCadastroState extends State<CafeteriaCadastro> {
  var cafeteriaController = CafeteriaController(CafeteriaRepository());

  String nome = '';
  String endereco = '';
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
                          labelText: 'Nome Cafeteria',
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) {
                        endereco = text;
                      },
                      decoration: InputDecoration(
                          labelText: 'Endereço Cafeteria',
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        child: Text('Cadastrar Cafeteria'),
                        onPressed: () {
                          Cafeteria cafeteria =
                              Cafeteria(id: 10, nome: nome, endereco: endereco);
                          cafeteriaController.postCafeteria(cafeteria);
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => HomePage()));
                        })
                  ],
                ),
              )),
        ));
  }
}
