import 'package:application_enviproduct_v01/src/widgets/paradas_widget.dart';
import 'package:application_enviproduct_v01/src/widgets/inicio_widget.dart';
import 'package:application_enviproduct_v01/src/widgets/mapa_widget.dart';
import 'package:application_enviproduct_v01/src/widgets/entregas_widget.dart';
//import 'package:application_enviproduct_v01/src/widgets/proveedores_widget.dart';
import 'package:flutter/material.dart';

class MenuItem {
  String label;
  IconData icon;
  MenuItem(this.label, this.icon);
}
List<MenuItem> menuOptions = [
  MenuItem("Menú", Icons.menu),
  //MenuItem("Proveedores", Icons.production_quantity_limits),
  MenuItem("Mapa", Icons.map_outlined),
  MenuItem("Paradas", Icons.location_on_outlined),
  MenuItem("Entregas", Icons.assignment_outlined )
];

List<Widget> contentWidgets = [
  const InicioWidget(),
  //const ProveedoresWidget(),
  const MapaWidget(),
  const ParadasWidget(),
  const EntregaWidget()
];

