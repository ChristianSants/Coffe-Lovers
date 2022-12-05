import 'cafe.dart';

class Cafeteria {
  int? id;
  String? nome;
  String? endereco;
  List<Cafe>? cafes;

  Cafeteria({this.id, this.nome, this.endereco, this.cafes});

  Cafeteria.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    endereco = json['endereco'];
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
    data['endereco'] = this.endereco;
    if (this.cafes != null) {
      data['cafes'] = this.cafes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
