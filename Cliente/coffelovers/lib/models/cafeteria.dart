import 'dart:ffi';

class Cafeteria {
  final String nome;
  final String endereco;
  final Long user_id;

  Cafeteria(
      {required this.nome, required this.endereco, required this.user_id});

  factory Cafeteria.fromJson(dynamic json) {
    return Cafeteria(
      nome: json['nome'] as String,
      endereco: json['endereco'] as String,
      user_id: json['user_id'] as Long,
    );
  }

  static List<Cafeteria> cafeteriaFromSnapShot(List snapshot) {
    return snapshot.map((data) {
      return Cafeteria.fromJson(data);
    }).toList();
  }
}
