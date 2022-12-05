import 'package:coffelovers/models/cafe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CafeRepository {
  // use http
  String dataURL = 'http://localhost:8083/cafe';
  static const headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwODEiLCJ1cG4iOiJwYXVsbyIsImdyb3VwcyI6WyJVc2VyIl0sImZ1bGxfbmFtZSI6InBhdWxvIiwiaWF0IjoxNjcwMjAwNjg1LCJleHAiOjE2NzAyMDA5ODUsImp0aSI6IjFhZjdlZmQxLTIxNDktNGM1Mi05NWNjLTliODgwMmFiYzYzMyJ9.IhC1-VPBn1Gc-jNhCXlrTkvZ30Oyp_wErRqa2itWAj_VtSEqadiZ-kT7dN1-q12WJUZFiMDkMmoa3j8rvytofxIKrjbUBM0WHBxgtfUcZD_B8kVae3KWQ7Qg8MTZZ2x5Ztp5Xrzo3HW5qweA_K_mryCgvLmsl5Jqj-BrqjCu8gitwdKmSnZCil5ZMHzfXAfJ2_wmaWJw4QDzY1lnuuKYn9sfQOsgYiOskSqmMyOvFAg-iPznkstv12TS0f6zLSFa5NWgzBXrnJqRp3WPkHpAQbsnQEC1uBCQuf0Tqrw_qdybT4STfX9ukl6HIEONx2DCSoQ_njkYhNHvCvKcPfEJfA'
  };

  //get
  Future<List<Cafe>> getCafeList() async {
    print('entrou aqui');
    List<Cafe> cafeList = [];
    // falta editar
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
