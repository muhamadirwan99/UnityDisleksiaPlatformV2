import 'package:udp_v2/core.dart';

class InformasiDatabaseProvider extends ChangeNotifier {
  final DatabaseInformasiHelper databaseHelper;

  InformasiDatabaseProvider({required this.databaseHelper}) {
    getBookmarks();
  }

  ResultState? _state;
  ResultState? get state => _state;

  String _message = '';
  String get message => _message;

  List<Informasi> _bookmarks = [];
  List<Informasi> get bookmarks => _bookmarks;

  void getBookmarks() async {
    _bookmarks = await databaseHelper.getBookmarks();
    if (_bookmarks.isNotEmpty) {
      _state = ResultState.HasData;
    } else {
      _state = ResultState.NoData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addBookmark(Informasi informasi) async {
    try {
      await databaseHelper.insertBookmark(informasi);
      getBookmarks();
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isBookmarked(String id) async {
    final bookmarkedInformasi = await databaseHelper.getBookmarkById(id);
    return bookmarkedInformasi.isNotEmpty;
  }

  void removeBookmark(String id) async {
    try {
      await databaseHelper.removeBookmark(id);
      getBookmarks();
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
