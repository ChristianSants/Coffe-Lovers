import 'package:coffelovers/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class UsuarioRepository {
  String dataURL = 'http://localhost:8083/user';
  //get
  Future<List<User>> getUsuarioList() async {
    List<User> usuarioList = [];
    // falta editar
    var url = Uri.parse('$dataURL/getUsuarioList');
    var response = await http.get(url);
    print('status code : ${response.statusCode}');
    var body = json.decode(response.body);

    for (var i = 0; i < body.length; i++) {
      usuarioList.add(User.fromJson(body[i]));
    }
    return usuarioList;
  }

  Future<String> putUsuario(User usuario) async {
    var url = Uri.parse('$dataURL/putusuario');
    String resData = '';
    await http.put(
      url,
      body: {
        'nome': (usuario.nome),
        'login': (usuario.login),
        'senha': (usuario.senha),
      },
      headers: {'Autorization': 'our_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      return resData = result['completed'];
    });
    return resData;
  }

  Future<String> postUsuario(User usuario) async {
    var url = Uri.parse('$dataURL/save');
    print(usuario.toJson());
    var result = '';
    var response = await http.post(url, body: usuario.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }

  Future<String> deleteUsuario(User usuario) async {
    var url = Uri.parse('$dataURL/detele');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      return result = 'true';
    });
    return result;
  }
}
