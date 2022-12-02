import 'dart:convert';
import 'package:coffelovers/models/cafe.dart';
import 'package:http/http.dart' as http;

class CafeApi {
  static Future<List<Cafe>> getCafe() async {
    var uri = Uri.https('https://localhost:443', '/bff/cafe/list');

    final response = await http.get(uri, headers: {
      //Adicionar o token
    });
    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['cafe']){
      _temp.add(i[''][''])
    }
  }
}
