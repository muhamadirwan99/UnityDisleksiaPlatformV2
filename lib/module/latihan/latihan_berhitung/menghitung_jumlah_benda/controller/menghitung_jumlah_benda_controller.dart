import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/latihan/latihan_berhitung/menghitung_jumlah_benda/widget/finish_page.dart';
import 'package:udp_v2/module/latihan/latihan_berhitung/menghitung_jumlah_benda/widget/jawaban_benar.dart';
import 'package:udp_v2/module/latihan/latihan_berhitung/menghitung_jumlah_benda/widget/jawaban_salah.dart';

class MenghitungJumlahBendaController extends GetxController {
  MenghitungJumlahBendaView? view;
  List<String> tempArrayAnswerChoice = [];
  String tempAnswer = '';
  int lengthLatihan = 0;

//examples var
  String realAnswer = '5';
  List<String> arrayAnswerChoice = ['11', '12', '3', '7', '5'];
  String image =
      "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fkaki.png?alt=media&token=8a00fd6d-795d-4be0-8a0a-b114497ef77b";

  List<List<String>> answerChoiceHistory = [];

  void checkAnswer() {
    if (tempAnswer.contains(realAnswer)) {
      Get.to(const JawabanBenarMenghitungJumlahBenda(kdKelas: '1'));
      update();
    } else {
      Get.to(const JawabanSalahMenghitungAngka());
    }
  }

  @override
  void onInit() {
    tempArrayAnswerChoice = List.from(arrayAnswerChoice);
    super.onInit();
  }
}
