import 'package:nexplay/features/games/models/class/game_list_item.dart';
import 'package:nexplay/features/games/models/class/games.dart';
import 'package:nexplay/features/games/models/enum/add_game_form.dart';
import 'package:nexplay/features/games/models/repositories/app_database.dart';
import 'package:sqflite/sqflite.dart';

class GamesDatabase {
  Future<void> saveGame(Game game) async {
    Database db = await AppDatabase().getDatabase();

    await db.transaction((txn) async {
      int gameId = await txn.insert("tb_games", {
        'name': game.name,
        'status': game.status.name,
        'rating': game.rating,
        'to_do_description': game.toDoDescription,
        'image_path': game.imagePath,
        'id_genre': game.genre.id,
      });

      Batch batch = txn.batch();

      game.tags?.forEach((tag) {
        batch.insert('tb_games_tags', {'id_game': gameId, 'id_tag': tag.id});
      });

      await batch.commit();
    });
  }

  Future<List<GameListItem>> getAllGames() async {
    Database db = await AppDatabase().getDatabase();

    var rawData = await db.query('tb_games');
    List<GameListItem> data = rawData
        .map(
          (row) => GameListItem(
            name: row["name"] as String,
            status: GameStatus.values.byName(row["status"] as String),
            id: row["id_game"] as int,
            rating: row["rating"] as double,
          ),
        )
        .toList();
    return data;
  }
}
