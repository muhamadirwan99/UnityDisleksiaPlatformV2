import 'package:get/get.dart';
import 'package:udp_v2/core.dart';

class SoalCeritaController extends GetxController {
  SoalCeritaView? view;

//skema data
  List<String> question = [''];
  List<String> imageLink = [
    "https://images.unsplash.com/photo-1484517586036-ed3db9e3749e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  ];
  List<List<String>> answerChoice = [
    ['apa', 'aja', 'deh'],
    ['kenapa', 'bijiq', 'nangis']
  ];
  List<String> realAnswer = ['21'];
  String answer = "";

  //example data

  String question1 = 'kenapa bijiq berkacamata ?';
  String imageLink1 =
      "https://images.unsplash.com/photo-1484517586036-ed3db9e3749e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80";
  List<String> answerChoice1 = [
    'karena ikan hidup di air',
    'karena bumi itu bulat',
    'karena masih siang',
  ];
  String realAnswer1 = 'karena bumi itu bulat';
  String answer1 = "";
  void checkAnswer() {
    print("answer1");
    print(answer1);
    if (answer1.contains(realAnswer1)) {
//      Get.to(const JawabanBenarMenjawabSoalCerita(kdKelas: '1'));
      showInfoDialog("Benar");
      update();
    } else {
//      Get.to(const JawabanSalahMenjawabSoalCerita());
      showInfoDialog("Salah");
    }
  }
}
