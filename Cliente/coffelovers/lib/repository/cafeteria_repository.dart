import 'package:coffelovers/models/cafeteria.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CafeteriaRepository {
  // use http
  String dataURL = 'http://localhost:8083/cafeteria';

  //get
  Future<List<Cafeteria>> getCafeteriaList() async {
    List<Cafeteria> cafeteriaList = [];
    //Recuperando token
    var _sharedPreferences = await SharedPreferences.getInstance();
    String? token = (_sharedPreferences.getString('token'));

    var headers = {'Authorization': 'Bearer ${token}'};

    var url = Uri.parse('$dataURL/list');
    var response = await http.get(url, headers: headers);
    print('status code : ${response.statusCode}');
    var body = json.decode(response.body);

    for (var i = 0; i < body.length; i++) {
      cafeteriaList.add(Cafeteria.fromJson(body[i]));
    }
    return cafeteriaList;
  }

  Future<String> putCafeteria(Cafeteria cafeteria) async {
    var url = Uri.parse('$dataURL/putcafeteria');
    var _sharedPreferences = await SharedPreferences.getInstance();

    String? token = (_sharedPreferences.getString('token'));
    var headers = {'Authorization': 'Bearer ${token}'};

    String resData = '';
    await http
        .put(
      url,
      body: {
        'nome': (cafeteria.nome),
        'endereco': (cafeteria.endereco),
      },
      headers: headers,
    )
        .then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      return resData = result['completed'];
    });
    return resData;
  }

  Future<String> postCafeteria(Cafeteria cafeteria) async {
    var url = Uri.parse('$dataURL/save');
    var result = '';
    var _sharedPreferences = await SharedPreferences.getInstance();
    String? token = (_sharedPreferences.getString('token'));
    print(token);

    var headers = {'Authorization': 'Bearer ${token}'};
    var response =
        await http.post(url, headers: headers, body: cafeteria.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }

  Future<String> deleteCafeteria(Cafeteria cafeteria) async {
    var url = Uri.parse('$dataURL/detele');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      return result = 'true';
    });
    return result;
  }

  Future<String> searchCafeteria(Cafeteria cafeteria) {
    throw UnimplementedError();
  }
}
