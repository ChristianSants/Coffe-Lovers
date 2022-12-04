import 'package:coffelovers/models/cafe.dart';
import 'package:coffelovers/repository/cafe_repository.dart';

class CafeController {
  final CafeRepository _cafeRepository;

  CafeController(this._cafeRepository);

  Future<List<Cafe>> fetchCafeList() async {
    return _cafeRepository.getCafeList();
  }

  Future<String> putCafe(Cafe cafe) async {
    return _cafeRepository.putCafe(cafe);
  }

  Future<String> deleteCafe(Cafe cafe) async {
    return _cafeRepository.deleteCafe(cafe);
  }

  Future<String> postCafe(Cafe cafe) async {
    return _cafeRepository.postCafe(cafe);
  }
}
