import 'package:nexplay/features/games/models/class/tags.dart';
import 'package:sqflite/sqflite.dart';

import 'app_database.dart';

class TagsDatabase {
  Future<List<Tag>> getTags() async {
    Database db = await AppDatabase().getDatabase();

    var rawData = await db.query('tb_tags');
    List<Tag> data = rawData
        .map(
          (row) => Tag(
            id: row['id_tag'] as int,
            name: row['name'] as String,
            type: row['type'] as String,
          ),
        )
        .toList();

    return data;
  }
}
