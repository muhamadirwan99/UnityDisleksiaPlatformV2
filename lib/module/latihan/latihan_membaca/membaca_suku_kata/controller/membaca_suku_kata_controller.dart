import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:udp_v2/utils/show_info_dialog.dart';
import '../view/membaca_suku_kata_view.dart';

class MembacaSukuKataController extends GetxController {
  MembacaSukuKataView? view;

  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlay = false;

  void playAudio(String audioUrl) async {
    try {
      print('object');
      // Source audioSource = UrlSource(audioUrl);
      // audioPlayer.play(audioSource);
      final player = AudioPlayer();
      await player.play(UrlSource(audioUrl));
    } catch (e) {
      showInfoDialog("Jaringan atau Server Sedang Bermasalah");
    }
  }
}
