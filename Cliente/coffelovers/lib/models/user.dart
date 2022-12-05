import 'package:coffelovers/models/cafe.dart';

class User {
  int? id;
  String? nome;
  String? login;
  String? senha;
  List<Cafe>? cafes;

  User({this.id, this.nome, this.login, this.senha, this.cafes});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    login = json['login'];
    senha = json['senha'];
    if (json['cafes'] != null) {
      cafes = <Cafe>[];
      json['cafes'].forEach((v) {
        cafes!.add(new Cafe.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['login'] = this.login;
    data['senha'] = this.senha;
    if (this.cafes != null) {
      data['cafes'] = this.cafes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
