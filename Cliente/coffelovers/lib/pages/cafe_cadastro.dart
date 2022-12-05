import 'package:coffelovers/controller/cafe_controller.dart';
import 'package:coffelovers/controller/cafeteria_controller.dart';
import 'package:coffelovers/models/cafe.dart';
import 'package:coffelovers/pages/cafeteria_page.dart';
import 'package:coffelovers/pages/home_page.dart';
import 'package:coffelovers/repository/cafe_repository.dart';
import 'package:coffelovers/repository/cafeteria_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/cafeteria.dart';

class CafeCadastro extends StatefulWidget {
  const CafeCadastro({super.key});

  @override
  State<CafeCadastro> createState() => _CafeCadastroState();
}

class _CafeCadastroState extends State<CafeCadastro> {
  var cafeteriaController = CafeteriaController(CafeteriaRepository());
  var cafeController = CafeController(CafeRepository());

  String nome = '';
  int? nota;
  String tipo = '';

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
                          labelText: 'Nome Cafe', border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) {
                        nota = text as int;
                      },
                      decoration: InputDecoration(
                          labelText: 'Nota Café', border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      onChanged: (text) {
                        tipo = text;
                      },
                      decoration: InputDecoration(
                          labelText: 'Tipo Café', border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        child: Text('Cadastrar Café'),
                        onPressed: () {
                          Cafe cafe = Cafe(
                              id: 10,
                              nome: nome,
                              nota: nota,
                              favorito: false,
                              tipo: tipo);
                          cafeController.postCafe(cafe);
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => HomePage()));
                        })
                  ],
                ),
              )),
        ));
  }
}
