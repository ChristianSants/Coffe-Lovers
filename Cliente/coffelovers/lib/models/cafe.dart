import 'dart:ffi';

class Cafe {
  final Long id;
  final String nome;
  final int nota;
  final String tipo;
  final bool favorito;
  final Long cafeteria_id;
  final Long user_id;

  Cafe(
      {required this.id,
      required this.nome,
      required this.nota,
      required this.tipo,
      required this.favorito,
      required this.cafeteria_id,
      required this.user_id});

  factory Cafe.fromJson(dynamic json) {
    return Cafe(
      id: json['id'] as Long,
      nome: json['nome'] as String,
      nota: json['nota'] as int,
      tipo: json['tipo'] as String,
      favorito: json['favorito'] as bool,
      cafeteria_id: json['cafeteria_id'] as Long,
      user_id: json['user_id'] as Long,
    );
  }

  static List<Cafe> cafeFromSnapShot(List snapshot) {
    return snapshot.map((data) {
      return Cafe.fromJson(data);
    }).toList();
  }
}
