import 'package:application_enviproduct_v01/src/models/entregas_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EntregasAPPService {
  EntregasAPPService();
  final String _rootUrl = 'https://backendenviproduct.web.app/api/entregas';

  Future<List<Entregas>> getEntregas() async {
    List<Entregas> resultEntregas = [];
    try {
      var url = Uri.parse(_rootUrl);
      final responseList = await http.get(url);
      List<dynamic> listEntregas = json.decode(responseList.body);
      for (var item in listEntregas) {
        final entregas = Entregas.fromJson(item);
        resultEntregas.add(entregas);
      }
    } catch (ex) {
      
      return resultEntregas;
    }

    return resultEntregas;
  }
}
