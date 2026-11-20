import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // Instancia única de la clase
  static final DatabaseHelper instance = DatabaseHelper._init();

  // Variable que almacenará la base de datos
  static Database? _database;

  // Constructor privado
  DatabaseHelper._init();

  // constructor publico
  factory DatabaseHelper() {
    return instance;
  }

  // Obtener la base de datos
  Future<Database> get database async {
    // Si ya existe, la retornamos
    if (_database != null) {
      return _database!;
    }

    // Si no existe, la inicializamos
    _database = await _initDatabase();

    return _database!;
  }

  // Inicializar la base de datos
  Future<Database> _initDatabase() async {
    // Obtener la ubicación donde se guardará
    String path = join(await getDatabasesPath(), 'usuarios.db');

    // Abrir o crear la base de datos
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  // Crear las tablas
  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usuarios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        correo TEXT NOT NULL,
        edad INTEGER NOT NULL
      )
    ''');
  }

  Future close() async {
    final db = _database;

    if (db != null) {
      await db.close();
      _database = null;
    }
  }
}
