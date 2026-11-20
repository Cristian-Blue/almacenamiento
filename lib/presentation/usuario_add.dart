import 'package:almacenamiento/handler/usuario_handler.dart';
import 'package:material_ui/material_ui.dart';

class UsuarioAdd extends StatefulWidget {
  const new({super.key});

  @override
  State<UsuarioAdd> createState() => _UsuarioAddState();
}

class _UsuarioAddState extends State<UsuarioAdd> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();

  void saveForm(BuildContext context) {
    UsuarioHandler().saveUser(
      _nameController.text,
      _emailController.text,
      int.parse(_ageController.text),
    );
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Guardado')));
    _nameController.clear();
    _emailController.clear();
    _ageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    label: Text('Nombre'),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text('Correo'),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    label: Text('Edad'),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => saveForm(context),
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
