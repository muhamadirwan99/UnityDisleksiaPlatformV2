// ignore_for_file: unnecessary_import

import 'package:udp_v2/core.dart';
import 'package:udp_v2/db/database_video_helper.dart';
import 'package:udp_v2/utils/result_state.dart';

class VideoDatabaseProvider extends ChangeNotifier {
  final DatabaseVideoHelper databaseHelper;

  VideoDatabaseProvider({required this.databaseHelper}) {
    getBookmarks();
  }

  ResultState? _state;
  ResultState? get state => _state;

  String _message = '';
  String get message => _message;

  List<Video> _bookmarks = [];
  List<Video> get bookmarks => _bookmarks;

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

  void addBookmark(Video video) async {
    try {
      await databaseHelper.insertBookmark(video);
      getBookmarks();
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isBookmarked(String id) async {
    final bookmarkedVideo = await databaseHelper.getBookmarkById(id);
    return bookmarkedVideo.isNotEmpty;
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
