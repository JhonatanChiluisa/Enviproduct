import 'package:application_enviproduct_v01/src/widgets/menu_widget.dart';
import 'package:application_enviproduct_v01/src/widgets/paradas_widget.dart';
import 'package:application_enviproduct_v01/src/widgets/mapa_widget.dart';
import 'package:application_enviproduct_v01/src/widgets/entregas_widget.dart';
import 'package:flutter/material.dart';

class MenuItem {
  String label;
  IconData icon;
  MenuItem(this.label, this.icon);
}
List<MenuItem> menuOptions = [
  MenuItem("Menú", Icons.menu),
  MenuItem("Mapa", Icons.map_outlined),
  MenuItem("Paradas", Icons.location_on_outlined),
  MenuItem("Entregas", Icons.assignment_outlined )
];

List<Widget> contentWidgets = [
  const MenuWidget(),
  const MapaWidget(),
  const ParadasWidget(),
  const EntregaWidget()
];

