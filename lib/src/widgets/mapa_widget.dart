import 'package:flutter/material.dart';

class MapaWidget extends StatelessWidget {
  const MapaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ubicación actual"),
          ),
        body: const Center(
          child: Icon(Icons.map, size: 80.0,)
        ),
      ));
    
  }
}