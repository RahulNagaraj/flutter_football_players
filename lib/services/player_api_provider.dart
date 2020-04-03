import 'dart:convert';
import 'package:flutterfootballplayers/models/players_api_models.dart';
import 'package:http/http.dart' as http;

class PlayerApiProvider {
  String baseUrl = "https://www.easports.com/fifa/ultimate-team/api/fut/item?";
  final successCode = 200;

  Future<List<Players>> fetchPlayersByCountry(String countryId) async {
    final String countryUrl = "$baseUrl" + "country=" + "$countryId";
    final response = await http.get(countryUrl);

    final responseString = jsonDecode(response.body);
    if (response.statusCode == successCode) {
      return PlayersApiResult.fromJson(responseString).items;
    } else {
      throw Exception("Failed to load players");
    }
  }
}
