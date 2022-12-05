import 'package:coffelovers/controller/cafe_controller.dart';
import 'package:coffelovers/models/cafe.dart';
import 'package:coffelovers/pages/cafe_home_page.dart';
import 'package:coffelovers/pages/configuracoes_page.dart';
import 'package:coffelovers/pages/favoritos_page.dart';
import 'package:coffelovers/pages/cafeteria_page.dart';
import 'package:coffelovers/repository/cafe_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'nav_bar.dart';

import 'cadastro_page.dart';

class APITest extends StatefulWidget {
  const APITest({super.key});

  @override
  State<APITest> createState() => _APITestState();
}

class _APITestState extends State<APITest> {
  var cafeController = CafeController(CafeRepository());

  int currentIndex = 0;
  final screens = [
    CafeHomePage(),
    FavoritosPage(),
    //PesquisaPage(),
    ConfiguracoesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest API'),
      ),
      body: FutureBuilder<List<Cafe>>(
        future: cafeController.fetchCafeList(),
        builder: ((context, snapshot) {
          future:
          cafeController.fetchCafeList();
          builder:
          (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('error'),
              );
            }
          };

          return ListView.separated(
              itemBuilder: (context, index) {
                var cafe = snapshot.data?[index];
                return Container(
                  height: 100.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(children: [
                    Expanded(flex: 1, child: Text('${cafe?.id}')),
                    Expanded(flex: 3, child: Text('${cafe?.nome}')),
                    Expanded(flex: 3, child: Text('${cafe?.tipo}')),
                  ]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 0.5,
                  height: 0.5,
                );
              },
              itemCount: snapshot.data?.length ?? 0);
        }),
      ),
    );
  }
}
