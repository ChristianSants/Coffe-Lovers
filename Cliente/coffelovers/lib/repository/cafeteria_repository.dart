import 'package:coffelovers/models/cafeteria.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CafeteriaRepository {
  // use http
  String dataURL = 'http://localhost:8083/cafeteria';
  static const headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwODEiLCJ1cG4iOiJra2siLCJncm91cHMiOlsiVXNlciJdLCJmdWxsX25hbWUiOiJra2siLCJpYXQiOjE2NzAyMDU3NDksImV4cCI6MTY3MDIwNjA0OSwianRpIjoiNzNmMGVjZmYtNTUyMS00N2RlLTk3NTYtNzJkMzczYWEyM2U5In0.IJgxEZL61BffDosilFOm_ykoSpGobFoGk6rZfpgYtqaji4xAuuh6PNdCaI4i3WVchmRsKOueXbA6ZhaHUhADVdBD7O7QR2I_1a3duVoShZ3zxg3VimH2dnDr2BXHB1-QzvHK2s2EvDEU_m6CewmJAJIAixllLvOaYIufWVXuftRfaB672M8PpRyb-3HhMb3WtxCSPjPwa7oWiIOZooIrHPGaj6RX8GJkJO6-4TWz55YKkirUc13525n_WAX3Eghm1Avp6BOLrxmoc6_5I69OPHJgGtOm1KZQcBBkN6b2nBh9sjg34Rce1uOOK8ySMyoDCOGSJqr2cRUtEEszcpn4cg'
  };
  //get
  Future<List<Cafeteria>> getCafeteriaList() async {
    List<Cafeteria> cafeteriaList = [];
    // falta editar
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
    String resData = '';
    await http.put(
      url,
      body: {
        'nome': (cafeteria.nome),
        'endereco': (cafeteria.endereco),
      },
      headers: {'Autorization': 'our_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      return resData = result['completed'];
    });
    return resData;
  }

  Future<String> postCafeteria(Cafeteria cafeteria) async {
    var url = Uri.parse('$dataURL/cafe/');
    var result = '';
    var response = await http.post(url, body: cafeteria.toJson());
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
