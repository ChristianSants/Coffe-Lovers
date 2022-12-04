import 'package:coffelovers/models/cafe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CafeRepository {
  // use http
  String dataURL = 'nosso link';

  //get
  Future<List<Cafe>> getCafeList() async {
    List<Cafe> cafeList = [];
    // falta editar
    var url = Uri.parse('$dataURL/getCafeList');
    var response = await http.get(url);
    print('status code : ${response.statusCode}');
    var body = json.decode(response.body);

    for (var i = 0; i < body.length; i++) {
      cafeList.add(Cafe.fromJson(body[i]));
    }
    return cafeList;
  }

  Future<String> putCafe(Cafe cafe) async {
    var url = Uri.parse('$dataURL/putcafe');
    String resData = '';
    await http.put(
      url,
      body: {
        'nome': (cafe.nome),
        'nota': (cafe.nota),
        'favorito': (cafe.favorito),
        'tipo': (cafe.tipo)
      },
      headers: {'Autorization': 'our_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      return resData = result['completed'];
    });
    return resData;
  }

  Future<String> postCafe(Cafe cafe) async {
    print('${cafe.toJson()}');
    var url = Uri.parse('$dataURL/cafe/');
    var result = '';
    var response = await http.post(url, body: cafe.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }

  Future<String> deleteCafe(Cafe cafe) async {
    var url = Uri.parse('$dataURL/detele');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      return result = 'true';
    });
    return result;
  }

  Future<String> searchCafe(Cafe cafe) async {
    throw UnimplementedError();
  }
}
