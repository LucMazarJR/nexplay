import 'package:nexplay/features/games/models/class/game_list_item.dart';
import 'package:nexplay/features/games/models/repositories/games_database.dart';

class GamesListViewModel {
  final GamesDatabase _gamesDatabase;

  late final Future<List<GameListItem>> gamesItems = _gamesDatabase
      .getAllGames();

  GamesListViewModel({required this._gamesDatabase});
}
