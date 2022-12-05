import 'package:coffelovers/models/cafe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CafeRepository {
  // use http
  String dataURL = 'http://localhost:8083/cafe';

  //get
  Future<List<Cafe>> getCafeList() async {
    print('entrou aqui');
    List<Cafe> cafeList = [];

    var _sharedPreferences = await SharedPreferences.getInstance();
    String? token = (_sharedPreferences.getString('token'));
    var headers = {'Authorization': 'Bearer ${token}'};
    var url = Uri.parse('$dataURL/list');
    print('${url}');
    var response = await http.get(url, headers: headers);
    print('status code : ${response.statusCode}');
    var body = json.decode(response.body);

    for (var i = 0; i < body.length; i++) {
      print('entrou aqui2');
      cafeList.add(Cafe.fromJson(body[i]));
      print("${body[i]}");
    }
    return cafeList;
  }

  Future<String> putCafe(Cafe cafe) async {
    var url = Uri.parse('$dataURL/edit');
    var _sharedPreferences = await SharedPreferences.getInstance();
    String? token = (_sharedPreferences.getString('token'));

    var headers = {'Authorization': 'Bearer ${token}'};
    String resData = '';
    await http
        .put(
      url,
      body: {
        'nome': (cafe.nome),
        'nota': (cafe.nota),
        'favorito': (cafe.favorito),
        'tipo': (cafe.tipo)
      },
      headers: headers,
    )
        .then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      return resData = result['completed'];
    });
    return resData;
  }

  Future<String> postCafe(Cafe cafe) async {
    print('${cafe.toJson()}');
    var _sharedPreferences = await SharedPreferences.getInstance();
    String? token = (_sharedPreferences.getString('token'));
    var headers = {'Authorization': 'Bearer ${token}'};
    var url = Uri.parse('$dataURL/save');
    var result = '';
    var response = await http.post(url, body: cafe.toJson(), headers: headers);
    print(response.statusCode);
    print(response.body);
    return 'true';
  }

  Future<String> deleteCafe(Cafe cafe) async {
    var url = Uri.parse('$dataURL/detele');
    var _sharedPreferences = await SharedPreferences.getInstance();
    String? token = (_sharedPreferences.getString('token'));
    var headers = {'Authorization': 'Bearer ${token}'};
    var result = 'false';
    await http.delete(url, headers: headers).then((value) {
      print(value.body);
      return result = 'true';
    });
    return result;
  }
}
