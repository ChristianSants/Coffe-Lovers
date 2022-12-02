class Cafeteria {
  int? id;
  String? nome;
  String? endereco;
  String? imagem;
  int? userId;

  Cafeteria({this.id, this.nome, this.endereco, this.imagem, this.userId});

  Cafeteria.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    endereco = json['endereco'];
    imagem = json['imagem'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['endereco'] = this.endereco;
    data['imagem'] = this.imagem;
    data['user_id'] = this.userId;
    return data;
  }
}
