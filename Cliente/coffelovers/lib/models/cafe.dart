class Cafe {
  int? id;
  String? nome;
  int? nota;
  String? tipo;
  bool? favorito;
  String? imagem;
  int? cafeteriaId;
  int? userId;

  Cafe(
      {this.id,
      this.nome,
      this.nota,
      this.tipo,
      this.favorito,
      this.imagem,
      this.cafeteriaId,
      this.userId});

  Cafe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    nota = json['nota'];
    tipo = json['tipo'];
    favorito = json['favorito'];
    imagem = json['imagem'];
    cafeteriaId = json['cafeteria_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['nota'] = this.nota;
    data['tipo'] = this.tipo;
    data['favorito'] = this.favorito;
    data['imagem'] = this.imagem;
    data['cafeteria_id'] = this.cafeteriaId;
    data['user_id'] = this.userId;
    return data;
  }
}
