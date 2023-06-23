import 'package:get/get.dart';
import '../view/mencari_angka_hilang_view.dart';

class MencariAngkaHilangController extends GetxController {
  MencariAngkaHilangView? view;

  List<String> tempArrayQuestion = [''];
  List<String> tempArrayAnswerChoice = [''];
  List<String> tempArrayQuestion2 = [''];
  List<String> tempArrayAnswerChoice2 = [''];
  List<String> tempArrayAnswer = [''];

  List<String> arrayAnswer = ['1', '2', '3', '4', '5'];
  List<String> arrayAnswerChoice = ['9', '1', '3', '7'];
  List<String> question = ['_', '2', '_', '4', '5'];

  tapAnswerChoice() {}

  checkQuestionArray() {}

  removeAnswerChoice(int index, String text) {
    for (int i = 0; i < tempArrayQuestion.length; i++) {
      if (tempArrayQuestion[i] == '_') {
        tempArrayQuestion[i] = text;
        tempArrayAnswerChoice = List.from(tempArrayAnswerChoice)
          ..removeAt(index);
        break;
      }
    }
    update();
  }

  cancelAnswerChoice() {
    tempArrayAnswerChoice = List.from(arrayAnswerChoice);
    tempArrayQuestion = List.from(question);
    update();
  }

  @override
  void onInit() {
    tempArrayQuestion = question;
    tempArrayAnswer = arrayAnswer;
    tempArrayAnswerChoice = arrayAnswerChoice;
    tempArrayAnswerChoice2 = arrayAnswerChoice;
    tempArrayQuestion2 = question;
    super.onInit();
  }
}
