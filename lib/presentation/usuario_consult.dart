import 'package:almacenamiento/handler/usuario_handler.dart';
import 'package:almacenamiento/models/usuario_model.dart';
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';

class UsuarioConsult extends StatefulWidget {
  const new({super.key});

  @override
  State<UsuarioConsult> createState() => _UsuarioConsultState();
}

class _UsuarioConsultState extends State<UsuarioConsult> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UsuarioHandler().consultUser(),
      builder: (context, snapshot) {
        List<UsuarioModel> user = snapshot.data ?? [];
        return ListView.builder(
          itemCount: user.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(user[index].nombre),
                  Text('Edad: ${user[index].edad}'),
                ],
              ),
              subtitle: Text(user[index].correo),
            );
          },
        );
      },
    );
  }
}
