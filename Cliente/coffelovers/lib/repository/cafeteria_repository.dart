import 'package:coffelovers/models/cafeteria.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CafeteriaRepository {
  // use http
  String dataURL = 'http://localhost:8083/cafeteria';
  static const headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwODEiLCJ1cG4iOiJwYXVsbyIsImdyb3VwcyI6WyJVc2VyIl0sImZ1bGxfbmFtZSI6InBhdWxvIiwiaWF0IjoxNjcwMjQwMDA2LCJleHAiOjE2NzAyNDAzMDYsImp0aSI6IjU4M2YyZTc5LWM5ZjAtNGIxZS04N2NkLWJhOGRlYzdhMDNjOSJ9.EC-xnJdyIAREV5TSowkkPvjR57quC_x5c6OAa_E8iY3CH-5vb02RB9YYrg0uiTKk1NyNOHg3MmxauLr5exKuLADjrURWPkZh9lhaZvyajd90E-KDPWCMyFozhw86IuDHJ_4yo5XMwvtrxxl93la3gl62edHsfmW09QNiqx5JCTbNmpEavCRWx35vCEp8sjIQzJ92Kj8l8hqeORZmfl1zCrGs_ROGu7-DmC-EHXOt4QLrIQkNtd8K-Bvz5-CneWN3TlWW1KkAQul0LwvTbAcgg5EbRDGu1eUexkHUCOM2DJ1rcJ10jxS0AD4aciVorGTQb1tLKlcv_2pRDNb4K0FG_w'
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
    var url = Uri.parse('$dataURL/save');
    var result = '';
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
