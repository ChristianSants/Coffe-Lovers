import 'package:coffelovers/models/cafe.dart';
import 'package:coffelovers/models/usuario.dart';
import 'package:coffelovers/models/cafeteria.dart';

abstract class Repository {
  //cafeteria
  Future<List<Cafeteria>> getCafeteriaList();
  Future<String> patchCafeteriaCompleted(Cafeteria cafeteria);
  Future<String> putCafeteriaCompleted(Cafeteria cafeteria);
  Future<String> deletedCafeteria(Cafeteria cafeteria);
  Future<String> postCafeteria(Cafeteria cafeteria);

  //cafe
  Future<List<Cafe>> getCafeList();
  Future<String> patchCafeCompleted(Cafe cafe);
  Future<String> putCafeCompleted(Cafe cafe);
  Future<String> deletedCafe(Cafe cafe);
  Future<String> postCafe(Cafe cafe);

  //user
  Future<List<Usuario>> getUsuarioList();
  Future<String> patchUsuarioCompleted(Usuario usuario);
  Future<String> putUsuarioCompleted(Usuario usuario);
  Future<String> deletedUsuario(Usuario usuario);
  Future<String> postUsuario(Usuario usuario);
}
