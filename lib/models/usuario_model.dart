class UsuarioModel {
  int? id;
  String nombre;
  String correo;
  int edad;

  UsuarioModel({
    this.id,
    required this.nombre,
    required this.correo,
    required this.edad,
  });

  // Convertir un objeto Usuario en un Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'nombre': nombre, 'correo': correo, 'edad': edad};
  }

  // Crear un Usuario a partir de un Map
  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'],
      nombre: map['nombre'],
      correo: map['correo'],
      edad: map['edad'],
    );
  }
}
