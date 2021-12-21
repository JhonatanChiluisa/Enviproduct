import 'package:application_enviproduct_v01/providers/main_provider.dart';
import 'package:application_enviproduct_v01/src/utils/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


 final List<String> _options = ["Inicio", "Mapa", "Paradas", "Entregas"];



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final mainProvider = Provider.of<MainProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: SizedBox.square(
              dimension: 60.0,
              child: Switch(
                  value: mainProvider.mode,
                  onChanged: (bool value) async {
                    mainProvider.mode = value;
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool("mode", value);
                  })),
          title: Text('Enviproduct - ' + _options[mainProvider.index])),
      body: contentWidgets[mainProvider.index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            mainProvider.index = index;
          },
          type: BottomNavigationBarType.fixed,
          items: menuOptions
              .map((e) =>
                  BottomNavigationBarItem(label: e.label, icon: Icon(e.icon)))
              .toList(),
          currentIndex: mainProvider.index),
    );
  }
  
}
