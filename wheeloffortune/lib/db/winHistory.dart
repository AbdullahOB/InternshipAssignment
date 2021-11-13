import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wheeloffortune/models/winHistoryModel.dart';

//Database class, that will be used later in the code.
class HistoryDatabase {
  //define an instance for the database so we can use it when we use the database.
  static final HistoryDatabase instance = HistoryDatabase.init();
  static Database? _database;
  //initializing database with function _init.
  HistoryDatabase.init();
  //if the database isn't exist, make a new database, else return the database.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('winHistory.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $HistoryTable (
      ${WinHistoryFields.id} $idType,
      ${WinHistoryFields.prizeName} $textType,
      ${WinHistoryFields.winDate} $textType
    )
    ''');
  }

  Future<WinHistory> create(WinHistory win) async {
    final db = await instance.database;
    final id = await db.insert(HistoryTable, win.toJson());
    return win.copy(id: id);
  }

  Future<List<WinHistory>> readAllHistory() async {
    final db = await instance.database;
    final order = '${WinHistoryFields.winDate} ASC';
    final result = await db.query(HistoryTable, orderBy: order);

    return result.map((json) => WinHistory.fromJson(json)).toList();
  }

  Future deleteAll() async {
    final db = await instance.database;
    return await db.rawDelete("Delete from $HistoryTable");
  }

  Future close() async {
    final db = await instance.database;
    _database = null;
    db.close();
  }
}
