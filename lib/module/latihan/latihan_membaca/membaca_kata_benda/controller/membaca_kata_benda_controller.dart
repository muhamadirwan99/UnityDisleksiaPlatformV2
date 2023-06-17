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

  List<String> arrayAnswer = ['K', 'A', 'K', 'I'];
  List<String> arrayAnswerChoice = ['A', 'B', 'K', 'I'];
  List<String> question = ['K', '_', 'K', '_'];

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
    List<String> test = question;
    tempArrayQuestion.clear();
    print("tempArrayQuestion");
    print(tempArrayQuestion);
    tempArrayAnswerChoice = List.from(arrayAnswerChoice);
    tempArrayQuestion = List.from(question);
    update();
    print("test");
    print(test);
    print("tempArrayQuestion");
    print(tempArrayQuestion);
    print("arrayQuestion");
    print(question);
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
