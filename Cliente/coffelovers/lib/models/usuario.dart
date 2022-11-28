import 'dart:ffi';

class Usuario {
  final Long id;
  final String nome;
  final String login;
  final String senha;

  Usuario(
      {required this.id,
      required this.nome,
      required this.login,
      required this.senha});

  factory Usuario.fromJson(dynamic json) {
    return Usuario(
      id: json['id'] as Long,
      nome: json['nome'] as String,
      login: json['login'] as String,
      senha: json['senha'] as String,
    );
  }

  static List<Usuario> usuarioFromSnapShot(List snapshot) {
    return snapshot.map((data) {
      return Usuario.fromJson(data);
    }).toList();
  }
}
