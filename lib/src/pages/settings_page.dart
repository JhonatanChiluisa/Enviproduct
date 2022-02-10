import 'package:application_enviproduct_v01/src/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:developer' as developer;

import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final mainProvider = Provider.of<MainProvider>(context, listen: false);
    Map<String, dynamic> values = JwtDecoder.decode(mainProvider.token);
    developer.log(values.toString());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Enviproducts - Ajustes")),
        body: ListView(children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Cerrar sesión"),
              trailing: IconButton(
                  tooltip: "Cerrar sesión",
                  onPressed: () {
                    mainProvider.token = "";
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.logout)),
            ),
          ),
          const SettingMode()
        ]),
      ),
    );
  }
}

class SettingMode extends StatelessWidget {
  const SettingMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    return Card(
      child: ListTile(
        leading: const Icon(Icons.light_mode),
        title: const Text("Modo claro"),
        subtitle: const Text("Habilitar / deshabilitar el modo claro"),
        trailing: Switch(
          activeColor: Colors.lightGreen,
          inactiveThumbColor: Colors.tealAccent,
            value: mainProvider.mode,
            onChanged: (bool value) async {
              mainProvider.mode = value;
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool("mode", value);
            }),
      ),
    );
  }
}