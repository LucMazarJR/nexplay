import 'package:nexplay/features/games/models/class/genres.dart';
import 'package:nexplay/features/games/models/class/tags.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Database? db;

  AppDatabase._internal();
  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() => _instance;

  Future<Database> _open() async {
    const dbName = 'nexplay.db';
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);

    var openedDb = await openDatabase(
      path,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
      onUpgrade: _onUpgrade,
      version: 1,
    );

    db = openedDb;
    return openedDb;
  }

  Future<Database> getDatabase() async {
    if (db == null || !db!.isOpen) {
      await _open();
    }
    return db!;
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    // DDL

    await db.execute('''
      CREATE TABLE tb_tags (
        id_tag INTEGER PRIMARY KEY,
        name TEXT,
        type TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE tb_genres (
        id_genre INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');

    // Criação da tabela games
    await db.execute('''
      CREATE TABLE  tb_games (
        id_game INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        status TEXT NOT NULL CHECK (status IN ('novo', 'continuar', 'jogando', 'finalizado', 'abandonado')),
        imagePath TEXT,
        id_genre INTEGER,
        FOREIGN KEY (id_genre) REFERENCES tb_genres(id_genre) ON DELETE SET NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE tb_games_tags (
        id_game INTEGER,
        id_tag  INTEGER,
        PRIMARY KEY (id_game, id_tag),
        FOREIGN KEY (id_game) REFERENCES tb_games(id_game) ON DELETE CASCADE,
        FOREIGN KEY (id_tag) REFERENCES tb_tags(id_tag) ON DELETE CASCADE
      )
    ''');

    // DML
    Batch batch = db.batch();

    for (var genre in genresSeed) {
      batch.insert('tb_genres', {'name': genre.name});
    }

    for (var tag in tagsSeed) {
      batch.insert('tb_tags', {'name': tag.name, 'type': tag.type});
    }

    await batch.commit(noResult: true);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Lógica para atualização do banco
    // Tipo if (oldVersion < 2) { alterações 1 -> 2 }
  }
}
