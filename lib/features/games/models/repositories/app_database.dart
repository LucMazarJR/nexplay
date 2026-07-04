import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Database? db;

  AppDatabase._internal();
  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() => _instance;

  Future<Database> open() async {
    const dbName = 'nexplay.db';
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);

    var openedDb = await openDatabase(path, onCreate: _onCreate, version: 1);

    db = openedDb;
    return openedDb;
  }

  Future<Database> getDatabase() async {
    if (db == null || !db!.isOpen) {
      await open();
    }
    return db!;
  }

  Future<void> _onCreate(Database db, int version) async {}
}
