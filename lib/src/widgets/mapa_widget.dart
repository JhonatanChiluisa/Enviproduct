import 'package:flutter/material.dart';

class MapaWidget extends StatelessWidget {
  const MapaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.map_outlined, size: 50.0),
        Text("Mapa", style: Theme.of(context).textTheme.headline4)
      ],
    ));
  }
}