import 'package:get/get.dart';
import 'package:udp_v2/core.dart';

class SoalCeritaController extends GetxController {
  SoalCeritaView? view;

  int lengthLatihan = 0;

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

  String question1 = '“Kutu buku” artinya adalah...';
  String imageLink1 =
      "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fkutu_buku.png?alt=media&token=74aaea66-5413-4455-96b5-0c5e98455c45";
  List<dynamic> answerChoice1 = [
    'A. Suka Membaca',
    'B. Suka Memasak',
    'C. Suka Menjual',
  ];
  String realAnswer1 = 'A. Suka Membaca';
  String answer1 = "";
  void checkAnswer() {
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
