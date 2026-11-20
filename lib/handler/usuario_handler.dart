import 'package:almacenamiento/models/usuario_model.dart';
import 'package:almacenamiento/repository/usuario_repository.dart';

class UsuarioHandler {
  final UsuarioRepository ur = UsuarioRepository();

  Future<void> saveUser(String name, String mail, int age) async {
    UsuarioModel user = UsuarioModel.fromMap({
      'nombre': name,
      'correo': mail,
      'edad': age,
    });
    ur.insertarUsuario(user);
  }

  Future<List<UsuarioModel>> consultUser() async {
    List<Map<String, dynamic>> resultado = await ur.obtenerUsuarios();

    return resultado.map((map) {
      return UsuarioModel.fromMap(map);
    }).toList();
  }
}
