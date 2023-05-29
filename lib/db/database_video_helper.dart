import 'package:sqflite/sqflite.dart';
import 'package:udp_v2/core.dart';

class DatabaseVideoHelper {
  static DatabaseVideoHelper? _instance;
  static Database? _database;

  DatabaseVideoHelper._internal() {
    _instance = this;
  }

  factory DatabaseVideoHelper() => _instance ?? DatabaseVideoHelper._internal();

  static const String _tblBookmark = 'bookmarks';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/video.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblBookmark (
             linkModul TEXT,
             linkVideo TEXT,
             descMapel TEXT,
             namaBab TEXT,
             namaMapel TEXT PRIMARY KEY
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

  Future<void> insertBookmark(Video video) async {
    final db = await database;
    await db!.insert(_tblBookmark, video.toJson());
  }

  Future<List<Video>> getBookmarks() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblBookmark);

    return results.map((res) => Video.fromJson(res)).toList();
  }

  Future<Map> getBookmarkById(String namaMapel) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblBookmark,
      where: 'namaMapel = ?',
      whereArgs: [namaMapel],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeBookmark(String namaMapel) async {
    final db = await database;

    await db!.delete(
      _tblBookmark,
      where: 'namaMapel = ?',
      whereArgs: [namaMapel],
    );
  }
}
