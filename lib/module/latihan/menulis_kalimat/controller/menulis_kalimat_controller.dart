import 'package:get/get.dart';
import 'package:udp_v2/core.dart';

class MenulisKalimatController extends GetxController {
  MenulisKalimatView? view;

  TextEditingController textEditingController = TextEditingController();

  int lengthLatihan = 0;
  String question = "Tulislah kata dari “buah tangan” pada kolom dibawah …";
  String imageLink =
      "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fbuah_tangan.png?alt=media&token=83db5646-fb6f-43fc-b947-71de57e9a2f6";
  String narasi =
      "Sandi bulan lalu pergi ke jogja, sehingga membawakan bakpia sebagai “buah tangan” yaitu oleh-oleh.";
  String realAnswer = "buah tangan";
  bool isTrue = false;

  checkAsnwer(String answer) {
    if (answer.toLowerCase().trim().contains(realAnswer)) {
      isTrue = true;
      update();
    }
    print("Jawaban Mu Belum Benar!");
  }
}
