import 'package:application_enviproduct_v01/src/models/perfil_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PerfilService {
  PerfilService();
  final String _rootUrl = "https://backendenviproduct.web.app/api/perfil";
  Future<int> postPerfil(Perfil perfil) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      String _perfilBody = perfilToJson(perfil);
      var url = Uri.parse(_rootUrl);
      final response = await http.post(url, headers: _headers, body: _perfilBody);
      if (response.body.isEmpty) return 400;
      Map<String, dynamic> content = json.decode(response.body);
      return content["estado"];
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
      return 500;
    }
  }
}
