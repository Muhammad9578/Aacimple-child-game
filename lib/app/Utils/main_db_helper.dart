import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MainDatabaseHelper {
  static Database? _database;
  static const String tableName = 'phrases';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'phrases.db');
    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        keyField TEXT,
        language TEXT,
        phrase TEXT,
        picturePath TEXT,
        soundPath TEXT,
        isPictureVisible INTEGER,
        isTextVisible INTEGER,
        isSoundEnabled INTEGER,
        fontSize INTEGER,
        fontColor TEXT,
        bgColor TEXT
      )
    ''');
  }

  Future<int> insertPhrase(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> getAllPhrases() async {
    Database db = await database;
    return await db.query(tableName);
  }

  Future<int> updatePhrase(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update(tableName, row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deletePhrase(int id) async {
    Database db = await database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
