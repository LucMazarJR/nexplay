import 'package:nexplay/features/games/models/class/games.dart';
import 'package:nexplay/features/games/models/forms/add_game_form.dart';
import 'package:nexplay/features/games/models/repositories/games_database.dart';

class AddGameViewModel {
  GamesDatabase gamesDatabase = GamesDatabase();

  GameForm gameForm = GameForm(.nenhum);

  Future<void> saveGame() async {
    await gamesDatabase.saveGame(_toGame());
  }

  Game _toGame() {
    return Game(
      name: gameForm.name!,
      status: gameForm.status,
      genre: gameForm.genre!,
      toDoDescription: gameForm.toDoDescription,
      rating: gameForm.rating,
      tags: gameForm.tags,
      imagePath: gameForm.imagePath
    );
  }

  AddGameViewModel();
}
