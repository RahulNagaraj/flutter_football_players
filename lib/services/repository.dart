import 'package:flutterfootballplayers/models/players_api_models.dart';
import 'package:flutterfootballplayers/services/player_api_provider.dart';

class PlayerRepository {
  PlayerApiProvider _playerApiProvider = PlayerApiProvider();

  Future<List<Players>> fetchPlayersByCountry(String countryId) =>
      _playerApiProvider.fetchPlayersByCountry(countryId);
}
