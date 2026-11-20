import 'package:almacenamiento/presentation/usuario_add.dart';
import 'package:almacenamiento/presentation/usuario_consult.dart';
import 'package:material_ui/material_ui.dart';

const tab = [UsuarioAdd(), UsuarioConsult()];

class UsuarioScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<UsuarioScreen> createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreen> {
  int _tabNavigation = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('inicio')),
      body: tab[_tabNavigation],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabNavigation,
        onTap: (value) {
          setState(() {
            _tabNavigation = value;
          });
        },
        items: [
          BottomNavigationBarItem(label: 'Save', icon: Icon(Icons.save)),
          BottomNavigationBarItem(label: 'serach', icon: Icon(Icons.search)),
        ],
      ),
    );
  }
}
