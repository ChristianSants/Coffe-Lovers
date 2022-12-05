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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cafeController = CafeController(CafeRepository());

  int currentIndex = 0;
  final screens = [
    CafeteriaPage(),
    CafeHomePage(),
    FavoritosPage(),
    ConfiguracoesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.coffee_rounded),
              SizedBox(width: 10),
              Text('Coffee Lovers')
            ],
          ),
        ),
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Cafeterias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.coffee),
              label: 'Cafés',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Configurações',
            ),
          ],
        ));
  }
}
