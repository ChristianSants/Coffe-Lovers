import 'package:coffelovers/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioRepository {
  String dataURL = 'http://localhost:8080/bff/user';
  //get UserList
  Future<List<User>> getUsuarioList() async {
    List<User> usuarioList = [];
    // falta editar
    var url = Uri.parse('$dataURL/list');
    var response = await http.get(url);
    print('status code : ${response.statusCode}');
    var body = json.decode(response.body);

    for (var i = 0; i < body.length; i++) {
      usuarioList.add(User.fromJson(body[i]));
    }
    return usuarioList;
  }

  //Update User
  Future<String> putUsuario(User usuario) async {
    var url = Uri.parse('$dataURL/edit');
    var _sharedPreferences = await SharedPreferences.getInstance();
    String? token = (_sharedPreferences.getString('token'));

    var headers = {'Authorization': 'Bearer ${token}'};

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
    var url = Uri.parse('$dataURL/detele/${usuario.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      return result = 'true';
    });
    return result;
  }
}
