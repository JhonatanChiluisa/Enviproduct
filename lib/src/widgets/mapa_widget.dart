import 'package:flutter/material.dart';

class MapaWidget extends StatelessWidget {
  const MapaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Icon(Icons.map, size: 60.0,)
        ),
      ));
    
  }
}