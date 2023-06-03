import 'package:sqflite/sqflite.dart';
import 'package:udp_v2/core.dart';

class DatabaseInformasiHelper {
  static DatabaseInformasiHelper? _instance;
  static Database? _database;

  DatabaseInformasiHelper._internal() {
    _instance = this;
  }

  factory DatabaseInformasiHelper() =>
      _instance ?? DatabaseInformasiHelper._internal();

  static const String _tblBookmark = 'bookmarks';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/informasi.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblBookmark (
             title TEXT PRIMARY KEY,
             desc TEXT,
             date TEXT,
             link TEXT,
             image TEXT
           )
        ''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initializeDb();

    return _database;
  }

  Future<void> insertBookmark(Informasi informasi) async {
    final db = await database;
    await db!.insert(_tblBookmark, informasi.toJson());
  }

  Future<List<Informasi>> getBookmarks() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblBookmark);

    return results.map((res) => Informasi.fromJson(res)).toList();
  }

  Future<Map> getBookmarkById(String title) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblBookmark,
      where: 'title = ?',
      whereArgs: [title],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeBookmark(String title) async {
    final db = await database;

    await db!.delete(
      _tblBookmark,
      where: 'title = ?',
      whereArgs: [title],
    );
  }
}
