import 'cafeteria.dart';

class Cafe {
  int? id;
  String? nome;
  int? nota;
  String? tipo;
  bool? favorito;
  Cafeteria? cafeteria;

  Cafe(
      {this.id,
      this.nome,
      this.nota,
      this.tipo,
      this.favorito,
      this.cafeteria});

  Cafe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    nota = json['nota'];
    tipo = json['tipo'];
    favorito = json['favorito'];
    cafeteria = json['cafeteria'] != null
        ? new Cafeteria.fromJson(json['cafeteria'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['nota'] = this.nota;
    data['tipo'] = this.tipo;
    data['favorito'] = this.favorito;
    if (this.cafeteria != null) {
      data['cafeteria'] = this.cafeteria!.toJson();
    }
    return data;
  }
}
