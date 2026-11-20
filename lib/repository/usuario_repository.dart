import 'package:almacenamiento/database/database_helper.dart';
import 'package:almacenamiento/models/usuario_model.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioRepository {
  Future<int> insertarUsuario(UsuarioModel usuario) async {
    Database db = await DatabaseHelper().database;

    return await db.insert('usuarios', usuario.toMap());
  }

  Future<List<Map<String, dynamic>>> obtenerUsuarios() async {
    Database db = await DatabaseHelper().database;

    List<Map<String, dynamic>> resultado = await db.query('usuarios');

    return resultado;
  }

  Future<UsuarioModel?> obtenerUsuarioPorId(int id) async {
    Database db = await DatabaseHelper().database;

    List<Map<String, dynamic>> resultado = await db.query(
      'usuarios',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (resultado.isNotEmpty) {
      return UsuarioModel.fromMap(resultado.first);
    }

    return null;
  }

  Future<int> actualizarUsuario(UsuarioModel usuario) async {
    Database db = await DatabaseHelper().database;

    return await db.update(
      'usuarios',
      usuario.toMap(),
      where: 'id = ?',
      whereArgs: [usuario.id],
    );
  }

  Future<int> eliminarUsuario(int id) async {
    Database db = await DatabaseHelper().database;

    return await db.delete('usuarios', where: 'id = ?', whereArgs: [id]);
  }
}
