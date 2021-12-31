import 'package:flutter/material.dart';

class MapaWidget extends StatelessWidget {
  const MapaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset("assets/images/logo_GoogleMaps.png",fit: BoxFit.cover )
        ),
      ));
    
  }
}