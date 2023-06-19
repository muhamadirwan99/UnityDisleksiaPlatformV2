import 'package:get/get.dart';
import '../view/mencari_huruf_vokal_konsonan_view.dart';

class MencariHurufVokalKonsonanController extends GetxController {
  MencariHurufVokalKonsonanView? view;
  String letter = "keluarga";
  String gambar =
      "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fkeluarga.png?alt=media&token=da874f72-d8f5-489f-b469-71798fa953bd";
  int lengthLatihan = 0;
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
