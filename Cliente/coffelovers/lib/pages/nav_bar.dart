import 'dart:html';

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
              "https://media-exp1.licdn.com/dms/image/C5603AQE8ClfXI0mf3A/profile-displayphoto-shrink_800_800/0/1657723458769?e=2147483647&v=beta&t=CmhUJU75l-vgCzz78i6c05EqB4du12wKeAdv200I6dE",
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ))),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp7Wk9GQusyaY6Q88KUD6igtbOxLMO79c-xZ7f9QIfhNar3KUlvxEEU6aPSDrfwtATV74&usqp=CAU',
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favoritos'),
            onTap: (() => print("Favoritos")),
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
