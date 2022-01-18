import 'package:application_enviproduct_v01/src/models/provedores_model.dart';
import 'package:application_enviproduct_v01/src/providers/db_provider.dart';
import 'package:flutter/cupertino.dart';

class ProveedorProvider extends ChangeNotifier {
  List<Proveedor> elements = [];
   Future<Proveedor> addElement(Proveedor model) async {
    final id = await DBProvider.dbProvider.insert(model);
    model.id = id;
    elements.add(model);
    notifyListeners();
    return model;
  }

   Future<List<Proveedor>> loadElements() async {
    elements = await DBProvider.dbProvider.list();
    return elements;
  }
}
