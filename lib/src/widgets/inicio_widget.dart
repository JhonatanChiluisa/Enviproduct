
import 'package:application_enviproduct_v01/src/pages/crear_perfil_page.dart';
import 'package:application_enviproduct_v01/src/pages/velocimetro_page.dart';
import 'package:application_enviproduct_v01/src/widgets/entregas_widget.dart';
import 'package:application_enviproduct_v01/src/widgets/mapa_widget.dart';

import 'package:flutter/material.dart';

class InicioWidget extends StatelessWidget {
  const InicioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          const Text("Menú Principal", style: TextStyle(fontSize: 40.0)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Image.asset("assets/images/logoEnviproducts.png"),
          ),
          Card(
            elevation: 7.0,
            child: ListTile(
              leading: const Icon(Icons.account_circle_rounded, size: 40.0,),
              title: const Text('Crear Perfil', style: TextStyle(fontSize: 20.0),),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.teal),
              onTap:  () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    const CrearPerfilPage(),
              ),
            );
          } ,
            ),
          ),
          Card(
            elevation: 7.0,
            child: ListTile(
              leading: const Icon(Icons.map_sharp, size: 40.0,),
              title: const Text('Mapa', style: TextStyle(fontSize: 20.0),),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.teal),
              onTap:  () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    const MapaWidget(),
              ),
            );
          } ,
            ),
          ),
          const Card(
            elevation: 7.0,
            child: ListTile(
              leading: Icon(Icons.calendar_today_rounded, size: 40.0,),
              title: Text('Calendario', style: TextStyle(fontSize: 20.0),),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal),
            ),
          ),
          Card(

            elevation: 7.0,
            child: ListTile(
              leading: const Icon(Icons.speed_rounded, size: 40.0,),
              title: const Text('Velocímetro', style: TextStyle(fontSize: 20.0),),
               trailing: const Icon(Icons.arrow_forward_ios, color: Colors.teal),
              onTap: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    const VelocimetroPage(),
              ),
            );
          },
            ),
          ),
          Card(
            elevation: 7.0,
            child: ListTile(
              leading: const Icon(Icons.assignment_late_sharp, size: 40.0,),
              title: const Text('Entregas', style: TextStyle(fontSize: 20.0),),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.teal),
              onTap: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    const EntregaWidget(),
              ),
            );
          }
            ),
          ),
          const Card(

            elevation: 7.0,
            child: ListTile(
              leading: Icon(Icons.business_rounded, size: 40.0,),
              title: Text('Proveedores', style: TextStyle(fontSize: 20.0),),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal),
            ),
          ),
      ]
    ),
        );
  }
}
