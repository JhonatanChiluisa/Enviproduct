import 'package:application_enviproduct_v01/src/utils/main_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _options = ["Inicio", "Mapa", "Entregas", "Perfil"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Enviproduct - ' + _options[_selectedIndex])),
      body: contentWidgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            _selectedIndex = index;
            //print("3. Cambio de estado");
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: menuOptions
              .map((e) =>
                  BottomNavigationBarItem(label: e.label, icon: Icon(e.icon)))
              .toList(),
          currentIndex: _selectedIndex),
    );
  }
}