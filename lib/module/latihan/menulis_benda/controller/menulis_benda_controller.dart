import 'package:get/get.dart';
import 'package:udp_v2/core.dart';

class MenulisBendaController extends GetxController {
  MenulisBendaView? view;

  TextEditingController textEditingController = TextEditingController();

  int lengthLatihan = 0;
  String hint = "“Iffah Fadhilah”";
  String imageLink =
      "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fiffah.png?alt=media&token=a5f3eca0-77e6-43ea-8b8b-833241c910f2";
  String realAnswer = "iffah fadhilah";
  bool isTrue = false;

  checkAsnwer(String answer) {
    if (answer.toLowerCase().trim().contains(realAnswer)) {
      isTrue = true;
      update();
    }
  }
}
