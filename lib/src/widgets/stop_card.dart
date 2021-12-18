import 'package:application_enviproduct_v01/src/models/stop_model.dart';
import 'package:flutter/material.dart';

class StopCard extends StatelessWidget {
  const StopCard({Key? key, required this.model}) : super(key: key);
  final Paradas model;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            trailing: const Checkbox(value: false, onChanged: null),
            leading: const Icon(Icons.alt_route, color:Colors.blue, size: 40.0),
            title: Text(model.name ?? ""),
            subtitle: Text(model.locationType ?? ""),
          ),
          ListTile(
            leading: const Icon(Icons.code , color:Colors.black, size: 25.0),
            title: Text(model.code ?? ""),
          ),
          ListTile(
            leading: const Icon(Icons.vpn_key  , color:Colors.black, size: 25.0),
            title: Text(model.stopId ?? ""),
          ),
        ],
      ),
    );
  }
}
