import 'package:coffelovers/controller/cafe_controller.dart';
import 'package:coffelovers/pages/cafe_cadastro.dart';
import 'package:coffelovers/pages/cafe_card.dart';
import 'package:coffelovers/repository/cafe_repository.dart';
import 'package:flutter/material.dart';

class CafeHomePage extends StatefulWidget {
  const CafeHomePage({super.key});

  @override
  State<CafeHomePage> createState() => _CafeHomePageState();
}

class _CafeHomePageState extends State<CafeHomePage> {
  var cafeController = CafeController(CafeRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: cafeController.fetchCafeList(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar cafés'),
              );
            }

            return ListView.separated(
                itemBuilder: ((context, index) {
                  var cafe = snapshot.data?[index];
                  return CafeCard(
                      nome: '${cafe?.nome}',
                      nota: '${cafe?.nota}',
                      tipo: '${cafe?.tipo}');
                }),
                separatorBuilder: ((context, index) {
                  return SizedBox(width: 7);
                }),
                itemCount: snapshot.data?.length ?? 0);
          }),
/*
        child: CafeCard(
          nome: "Meu Café",
          nota: "5",
          tipo: "Amargo",
        ),
        */
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => CafeCadastro()));
          },
          child: Icon(Icons.add),
        ));
  }
}
