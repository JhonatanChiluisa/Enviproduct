import 'package:application_enviproduct_v01/src/models/stop_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StopService {
  StopService();
  final String _rootUrl =
      "https://transloc-api-1-2.p.rapidapi.com/stops.json?agencies=12,16&geo_area=35.80176,-78.64347|35.78061,-78.68218&callback=call";

  Future<List<Paradas>> getStop() async {
    List<Paradas> result = [];
    try {
      var url = Uri.parse(_rootUrl);
      var headers = {
        "x-rapidapi-host": "transloc-api-1-2.p.rapidapi.com",
        "x-rapidapi-key": "f14eb385f8msh6d9e8470c04c22dp1858b9jsncec7d926e369"
      };

      final response = await http.get(url, headers: headers);
      if (response.body.isEmpty) return result;
      Map<String, dynamic> content = json.decode(response.body);
      List<dynamic> feed = content["data"];
      for (var item in feed) {
        final route = Paradas.fromJson(item);
        result.add(route);
      }
      return result;
    } catch (ex) {
      return result;
    }
  }
}

