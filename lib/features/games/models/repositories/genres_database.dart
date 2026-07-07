import 'package:nexplay/features/games/models/class/genres.dart';
import 'package:nexplay/features/games/models/repositories/app_database.dart';
import 'package:sqflite/sqflite.dart';

class GenresDatabase {
  Future<List<Genre>> getGenres() async {
    Database db = await AppDatabase().getDatabase();

    var rawData = await db.query('tb_genres');
    List<Genre> data = rawData
        .map(
          (row) =>
              Genre(id: row['id_genre'] as int, name: row['name'] as String),
        )
        .toList();

    return data;
  }
}
