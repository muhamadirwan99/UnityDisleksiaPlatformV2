import 'package:get/get.dart';
import 'package:udp_v2/utils/show_info_dialog.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../view/bookmark_view.dart';

class BookmarkController extends GetxController {
  BookmarkView? view;

  List<bool> isSelected = [true, false];
  String image = "";

  getThumbnail(String link) {
    try {
      String? videoId = YoutubePlayer.convertUrlToId(link);
      image = "https://img.youtube.com/vi/$videoId/0.jpg";
    } on Exception catch (exception) {
      showInfoDialog(exception.toString());
    } catch (error) {
      showInfoDialog(error.toString());
    }
  }
}
