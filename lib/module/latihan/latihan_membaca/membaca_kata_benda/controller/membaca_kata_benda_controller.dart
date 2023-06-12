import 'package:get/get.dart';
import '../view/membaca_kata_benda_view.dart';

class MembacaKataBendaController extends GetxController {
  MembacaKataBendaView? view;
  static MembacaKataBendaController instance = MembacaKataBendaController();
  List<String> tempArrayQuestion = [''];
  List<String> tempArrayAnswerChoice = [''];
  List<String> tempArrayQuestion2 = [''];
  List<String> tempArrayAnswerChoice2 = [''];
  List<String> tempArrayAnswer = [''];

  tapAnswerChoice() {}

  checkQuestionArray() {}

  removeAnswerChoice(int index, String text) {
    print(tempArrayAnswerChoice);
    tempArrayAnswerChoice = List.from(tempArrayAnswerChoice)..removeAt(index);
    print(tempArrayAnswerChoice);
    update();
  }

  cancelAnswerChoice() {}
}
