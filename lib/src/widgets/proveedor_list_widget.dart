import 'package:application_enviproduct_v01/src/models/provedores_model.dart';
import 'package:application_enviproduct_v01/src/pages/proveedor_form_page.dart';
import 'package:application_enviproduct_v01/src/providers/proveedor_provider.dart';
import 'package:application_enviproduct_v01/src/widgets/proveedor_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProveedorListWidget extends StatelessWidget {
  const ProveedorListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final proveedorProvider =
        Provider.of<ProveedorProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Proveedores"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Proveedor>>(
          future: proveedorProvider.loadElements(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                  child: SizedBox.square(
                      dimension: 50.0, child: Text("Un error ha ocurrido")));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBox.square(
                    dimension: 50.0, child: CircularProgressIndicator()),
              );
            }

            return Scaffold(
              body: snapshot.data!.isEmpty
                  ? const Center(
                      child: SizedBox.square(
                          dimension: 150.0,
                          child: Text("No hay datos en el SQLite")))
                  : ListView(
                      children: snapshot.data!
                          .map((e) => ProveedorCard(model: e))
                          .toList(),
                    ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const ProveedorFormPage(),
                      ),
                    );
                  },
                  child: const Icon(Icons.add)),
            );
          }),
    );
  }
}
