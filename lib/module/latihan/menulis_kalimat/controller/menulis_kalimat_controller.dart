import 'package:get/get.dart';
import 'package:udp_v2/core.dart';

class MenulisKalimatController extends GetxController {
  MenulisKalimatView? view;
  String hint = "buah tangan";
  String imageLink =
      "https://images.unsplash.com/photo-1484517586036-ed3db9e3749e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80";
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
