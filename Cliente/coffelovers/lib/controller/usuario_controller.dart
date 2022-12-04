import 'package:coffelovers/models/usuario.dart';
import 'package:coffelovers/repository/usuario_repository.dart';

class UsuarioController {
  final UsuarioRepository _usuarioRepository;

  UsuarioController(this._usuarioRepository);

  Future<List<Usuario>> fetchCafeList() async {
    return _usuarioRepository.getUsuarioList();
  }

  Future<String> putUsuario(Usuario usuario) async {
    return _usuarioRepository.putUsuario(usuario);
  }

  Future<String> deleteUsuario(Usuario usuario) async {
    return _usuarioRepository.deleteUsuario(usuario);
  }

  Future<String> postUsuario(Usuario usuario) async {
    return _usuarioRepository.postUsuario(usuario);
  }
}
