import 'package:coffelovers/models/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsuarioRepository {
  String dataURL = 'nosso link';
  //get
  Future<List<Usuario>> getUsuarioList() async {
    List<Usuario> usuarioList = [];
    // falta editar
    var url = Uri.parse('$dataURL/getUsuarioList');
    var response = await http.get(url);
    print('status code : ${response.statusCode}');
    var body = json.decode(response.body);

    for (var i = 0; i < body.length; i++) {
      usuarioList.add(Usuario.fromJson(body[i]));
    }
    return usuarioList;
  }

  Future<String> putUsuario(Usuario usuario) async {
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

  Future<String> postUsuario(Usuario usuario) async {
    var url = Uri.parse('$dataURL/usuario/');
    var result = '';
    var response = await http.post(url, body: usuario.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }

  Future<String> deleteUsuario(Usuario usuario) async {
    var url = Uri.parse('$dataURL/detele');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      return result = 'true';
    });
    return result;
  }

  Future<String> searchUsuario(Usuario usuario) {
    throw UnimplementedError();
  }
}
