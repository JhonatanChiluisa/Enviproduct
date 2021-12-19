import 'package:application_enviproduct_v01/src/models/entregas_model.dart';
import 'package:flutter/material.dart';

class CardEntregas extends StatelessWidget {
  const CardEntregas({Key? key, required this.model}) : super(key: key);
  final Entregas model;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      child: ListTile(
        tileColor: Color.alphaBlend(Colors.amber.shade50, Colors.lime),
        leading: const Icon(Icons.calendar_today),
        title: Text(model.fieldsProto!.nombre!.stringValue.toString(),
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(model.fieldsProto!.luegardestino!.stringValue.toString(),
            style: Theme.of(context).textTheme.subtitle2),
        trailing: Text(
            "Costo: " +
                model.fieldsProto!.precio!.integerValue.toString() +
                " \$",
            style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}
