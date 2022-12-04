import 'package:coffelovers/models/cafeteria.dart';
import 'package:coffelovers/repository/cafeteria_repository.dart';

class CafeteriaController {
  final CafeteriaRepository _cafeteriaRepository;

  CafeteriaController(this._cafeteriaRepository);

  Future<List<Cafeteria>> fetchCafeList() async {
    return _cafeteriaRepository.getCafeteriaList();
  }

  Future<String> putCafeteria(Cafeteria cafeteria) async {
    return _cafeteriaRepository.putCafeteria(cafeteria);
  }

  Future<String> deleteCafeteria(Cafeteria cafeteria) async {
    return _cafeteriaRepository.deleteCafeteria(cafeteria);
  }

  Future<String> postCafeteria(Cafeteria cafeteria) async {
    return _cafeteriaRepository.postCafeteria(cafeteria);
  }
}
