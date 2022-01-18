import 'package:application_enviproduct_v01/src/models/provedores_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProveedorCard extends StatelessWidget {
  const ProveedorCard({Key? key, required this.model}) : super(key: key);
  final Proveedor model;

  @override
  Widget build(BuildContext context) {
    final icon = model.tipo == 0
        ? SizedBox(child: Image.asset("assets/images/dairyProducts.png"))
        : model.tipo == 1
            ? SizedBox(child: Image.asset("assets/images/meat.png"))
            : model.tipo == 2
                ? SizedBox(child: Image.asset("assets/images/food.png"))
                : model.tipo == 3
                  ?SizedBox(child: Image.asset("assets/images/product.png"))
                  :SizedBox(child: Image.asset("assets/images/fruit.png"));

    return Card(
        elevation: 12.0,
        child: Column(
          children: [
            ListTile(
                trailing: Text(model.id.toString()),
                leading: icon,
                title: Text(model.nombre),
                subtitle: Text(model.localizacion)),
            ListTile(
                leading: const Icon(Icons.local_phone),
                trailing: Expanded(
                  child: RatingBar.builder(
                    itemSize: 20,
                    itemCount: 5,
                    initialRating: 3.4,
                    itemBuilder: (context, _) {
                      return const Icon(Icons.star, color: Colors.amber);
                    },
                    onRatingUpdate: (rating) {}),
                ),
                title: Text(model.contacto))
          ],
        ));
  }
}
