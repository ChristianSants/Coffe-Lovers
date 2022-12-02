class Usuario {
  int? id;
  String? nome;
  String? login;
  String? senha;
  String? imagem;

  Usuario({this.id, this.nome, this.login, this.senha, this.imagem});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    login = json['login'];
    senha = json['senha'];
    imagem = json['imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['login'] = this.login;
    data['senha'] = this.senha;
    data['imagem'] = this.imagem;
    return data;
  }
}
