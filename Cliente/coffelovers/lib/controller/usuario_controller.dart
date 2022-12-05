import 'package:coffelovers/models/user.dart';
import 'package:coffelovers/repository/user_repository.dart';

class UsuarioController {
  final UsuarioRepository _usuarioRepository;

  UsuarioController(this._usuarioRepository);

  Future<List<User>> fetchCafeList() async {
    return _usuarioRepository.getUsuarioList();
  }

  Future<String> putUsuario(User usuario) async {
    return _usuarioRepository.putUsuario(usuario);
  }

  Future<String> deleteUsuario(User usuario) async {
    return _usuarioRepository.deleteUsuario(usuario);
  }

  Future<String> postUsuario(User usuario) async {
    return _usuarioRepository.postUsuario(usuario);
  }
}
