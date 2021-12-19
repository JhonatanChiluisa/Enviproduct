import 'package:flutter/material.dart';

class ProveedoresWidget extends StatelessWidget {
  const ProveedoresWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.home, size: 50.0),
        Text("Proveedores", style: Theme.of(context).textTheme.headline4)
      ]
    ));
  }
}