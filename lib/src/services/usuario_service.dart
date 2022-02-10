import 'package:application_enviproduct_v01/src/models/usario_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
class UsuarioService{
  final String _firebaseAPIKey = 'AIzaSyA_NCGQ7dRiOrQa5ShcJU6lUFbh7QwPjRI';

  Future<Map<String, dynamic>> login(Usuario usuario) async {
    final authData = {
      'email': usuario.email,
      'password': usuario.password,
      'returnSecureToken': true
    };

    final queryParams = {"key": _firebaseAPIKey};

    var uri = Uri.https("www.googleapis.com",
        "/identitytoolkit/v3/relyingparty/verifyPassword", queryParams);

    final resp = await http.post(uri, body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    developer.log(decodedResp.toString());
    return decodedResp;
  }
}