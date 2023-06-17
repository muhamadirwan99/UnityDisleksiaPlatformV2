import 'package:get/get.dart';
import '../view/mencari_huruf_vokal_konsonan_view.dart';

class MencariHurufVokalKonsonanController extends GetxController {
  MencariHurufVokalKonsonanView? view;
  String letter = "keluarga";
  RxList<bool> isVokalList = <bool>[].obs;
  RxList<bool> isVokalListAwnser = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    isVokalList.assignAll(List<bool>.generate(letter.length, (index) => false));
    findAwnserValue(letter);
  }

  bool isVokal(String letter) {
    letter = letter.toLowerCase();
    List<String> vowels = ['a', 'e', 'i', 'o', 'u'];
    return vowels.contains(letter);
  }

  void findAwnserValue(letter) {
    isVokalListAwnser.assignAll(
      List<bool>.generate(letter.length, (index) {
        return isVokal(letter[index]);
      }),
    );
  }

  changeValue(index) {
    isVokalList[index] = true;
    update();
  }
}
