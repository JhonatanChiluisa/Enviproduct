import 'package:application_enviproduct_v01/src/widgets/google_maps.dart';
import 'package:application_enviproduct_v01/src/widgets/menu_widget.dart';
import 'package:application_enviproduct_v01/src/widgets/paradas_widget.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

CollectionReference entregas =
    FirebaseFirestore.instance.collection('entregas');

class MenuItem {
  String label;
  IconData icon;
  MenuItem(this.label, this.icon);
}

List<MenuItem> menuOptions = [
  MenuItem("Menú", Icons.menu),
  MenuItem("Mapa", Icons.assignment_outlined),
  MenuItem("Paradas", Icons.location_on_outlined),
  MenuItem("Entregas", Icons.assignment_outlined)
];

List<Widget> contentWidgets = [
  const MenuWidget(),
  const MapaGoogle(),
  const ParadasWidget(),
];
