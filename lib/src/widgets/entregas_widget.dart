import 'package:flutter/material.dart';

class EntregasWidget extends StatelessWidget {
  const EntregasWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.airport_shuttle_sharp , size: 50.0),
        Text("Entregas", style: Theme.of(context).textTheme.headline4)
      ],
    ));
  }
}