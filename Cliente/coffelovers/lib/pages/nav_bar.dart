import 'dart:html';

import 'package:coffelovers/pages/favoritos_page.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Paulo Acassio'),
            accountEmail: Text('pauloacassio205@outlook.com'),
            currentAccountPicture: CircleAvatar(
                child: ClipOval(
                    child: Image.network(
              "https://img.elo7.com.br/product/original/362C4C6/robo-para-uma-empresa-provedora-de-internet-mascote.jpg",
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ))),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.pinimg.com/originals/5e/68/7f/5e687f0835e049f7ac499d3554465ef2.jpg',
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favoritos'),
            onTap: (() => FavoritosPage()),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Amigos'),
            onTap: (() => print("Amigos")),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Compartilhe'),
            onTap: (() => print("Compartilhar")),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notificações'),
            onTap: (() => print("Notificações")),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            onTap: (() => print("Configurações")),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: (() => print("Sair")),
          ),
        ],
      ),
    );
  }
}
