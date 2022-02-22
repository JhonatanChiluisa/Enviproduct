import 'package:application_enviproduct_v01/src/models/entregas.dart';
import 'package:application_enviproduct_v01/src/widgets/mapa_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CardEntregas extends StatefulWidget {
  const CardEntregas({Key? key, required this.currentEntrega})
      : super(key: key);
  final CollectionReference currentEntrega;

  @override
  State<CardEntregas> createState() => _CardEntregasState();
}

class _CardEntregasState extends State<CardEntregas> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Entregas Pendientes"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            entregas(),
          ],
        )),
      ),
    );
  }

  Widget entregas() {
    return StreamBuilder(
        stream: widget.currentEntrega.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('Cargando'));
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: snapshot.data!.docs.map((pasajeros) {
              var entrgs =
                  Entrega.fromJson(pasajeros.data() as Map<String, dynamic>);
              return Column(children: [
                Card(
                  elevation: 12.0,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.person_outline,
                              color: Colors.teal, size: 40),
                          title: Text(entrgs.nombre.toString(),
                              style: Theme.of(context).textTheme.headline6),
                          subtitle: Text(entrgs.lugarDestino.toString(),
                              style: Theme.of(context).textTheme.subtitle2),
                          trailing: Text(
                              "Costo: " + entrgs.precio.toString() + " \$",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        ListTile(
                          leading: const Icon(Icons.date_range,
                              color: Colors.black, size: 25),
                          title: Text(entrgs.fechaEntrega.toString()),
                          subtitle: Text(entrgs.producto.toString()),
                          trailing: Text(
                            "Cantidad: " + entrgs.cantidad.toString(),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 100,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MapaWidget(listaentrega: entrgs);
                                  },
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                Colors.greenAccent,
                                Theme.of(context).primaryColor,
                              ])),
                              child: const Center(
                                  child: Text(
                                "Ubicación",
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]);
            }).toList(),
          );
        });
  }
}
