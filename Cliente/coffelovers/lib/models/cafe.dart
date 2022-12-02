import 'dart:ffi';

class Cafe {
  final String nome;
  final int nota;
  final String tipo;
  final bool favorito;
  final String imagem;

  Cafe({
    required this.nome,
    required this.nota,
    required this.tipo,
    required this.favorito,
    required this.imagem,
  });

  factory Cafe.fromJson(dynamic json) {
    return Cafe(
      nome: json['nome'] as String,
      nota: json['nota'] as int,
      tipo: json['tipo'] as String,
      favorito: json['favorito'] as bool,
      imagem: json['imagem'] as String,
    );
  }

  static List<Cafe> cafeFromSnapShot(List snapshot) {
    return snapshot.map((data) {
      return Cafe.fromJson(data);
    }).toList();
  }
}
