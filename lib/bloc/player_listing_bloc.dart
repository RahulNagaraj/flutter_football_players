import 'package:bloc/bloc.dart';
import 'package:flutterfootballplayers/bloc/player_listing_events.dart';
import 'package:flutterfootballplayers/bloc/player_listing_states.dart';
import 'package:flutterfootballplayers/models/players_api_models.dart';
import 'package:flutterfootballplayers/services/repository.dart';

class PlayerListingBloc extends Bloc<PlayerListingEvent, PlayerListingState> {
  final PlayerRepository playerRepository;
  
  PlayerListingBloc({this.playerRepository}) : assert(playerRepository != null);
  
  @override
  PlayerListingState get initialState => PlayerUninitializedState();

  @override
  Stream<PlayerListingState> mapEventToState(PlayerListingState currentState, PlayerListingEvent event) async* {
    if (event is CountrySelectedEvent) {
      yield PlayerFetchingState();
      try {
        final List<Players> players = await playerRepository.fetchPlayersByCountry(event.nationModel.countryId);
        if (players.length == 0) {
          yield PlayerEmptyState();
        } else {
          yield PlayerFetchedState(players: players);
        }
      } catch (_) {
        yield PlayerErrorState();
      }
    }
  }
}
