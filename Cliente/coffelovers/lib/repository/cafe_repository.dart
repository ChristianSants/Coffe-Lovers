import 'package:coffelovers/models/cafe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CafeRepository {
  // use http
  String dataURL = 'http://localhost:8083/cafe';
  static const headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwODEiLCJ1cG4iOiJwYXVsbyIsImdyb3VwcyI6WyJVc2VyIl0sImZ1bGxfbmFtZSI6InBhdWxvIiwiaWF0IjoxNjcwMjM4Njc1LCJleHAiOjE2NzAyMzg5NzUsImp0aSI6IjA4M2JhOTZhLWExNjQtNGQxNS04MzJlLWUxZGE0MzY2YzU5NiJ9.ktkaTChA0CO3ObYE-RYEn2rBoJFoPJP00Ox6Zumqf_K6WS__A_ShRIDaQ0TyVOEE5s779quPgFvPZkq1G615NXcZ7WWQrGLW-Cu84Reosu0y1Z-DSHe7LysH8j2rOe8R9VG8mKLmMthgdMoqL-PJ5fbcUTTRVcLJrRq4Tb5jJDJyDs-gbbCs377ifGxNbNPSbXdtF2tFouKkIZsLH6lxBuYW5HMhFY7J1Utb5uLnz8V9HP1jj771KEN7ZNbWWkh-fz2NyFXjt_fpfbhXXOORwwMVPbR15dpG2etObJm6kGQE4rMiCsErL3oYVqByddOxaZAPQkiZobLl1DiwpBRWZA'
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
    var url = Uri.parse('$dataURL/edit');
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
    var url = Uri.parse('$dataURL/save');
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
}
