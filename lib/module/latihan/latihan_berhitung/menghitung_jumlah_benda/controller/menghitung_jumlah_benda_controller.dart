import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/latihan/latihan_berhitung/menghitung_jumlah_benda/widget/jawaban_benar.dart';
import 'package:udp_v2/module/latihan/latihan_berhitung/menghitung_jumlah_benda/widget/jawaban_salah.dart';

class MenghitungJumlahBendaController extends GetxController {
  MenghitungJumlahBendaView? view;
  List<String> tempArrayAnswerChoice = [];
  String tempAnswer = '';
  int lengthLatihan = 0;

//examples var
  String title = "Hitung jumlah apel dibawah ini!";
  String soal = "";
  String realAnswer = '21';
  List<dynamic> arrayAnswerChoice = ['20', '21', '22'];
  String image =
      "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fapel.png?alt=media&token=9e200c1f-e614-4b2b-b14b-90c4a2212382";

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
