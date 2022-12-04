import 'package:coffelovers/models/cafeteria.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CafeteriaRepository {
  // use http
  String dataURL = 'nosso link';

  //get
  Future<List<Cafeteria>> getCafeteriaList() async {
    List<Cafeteria> cafeteriaList = [];
    // falta editar
    var url = Uri.parse('$dataURL/getCafeteriaList');
    var response = await http.get(url);
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
