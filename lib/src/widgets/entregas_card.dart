import 'package:application_enviproduct_v01/src/models/entregas_model.dart';
import 'package:flutter/material.dart';

class CardEntregas extends StatelessWidget {
  const CardEntregas({Key? key, required this.model}) : super(key: key);
  final Entregas model;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person_outline, color: Colors.teal, size: 40),
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
          ListTile(
             leading: const Icon(Icons.date_range, color: Colors.black, size: 25),
            title: Text(model.fieldsProto!.fechaentrega!.stringValue.toString()),
            subtitle: Text(model.fieldsProto!.producto!.stringValue.toString()),
            trailing: Text("Cantidad: " + model.fieldsProto!.cantidad!.integerValue.toString(),
          ),
          )
        ],
      ),
    );
  }
}
