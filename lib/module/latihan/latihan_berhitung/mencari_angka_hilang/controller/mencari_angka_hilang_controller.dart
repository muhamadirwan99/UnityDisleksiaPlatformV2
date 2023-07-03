import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/latihan/latihan_berhitung/mencari_angka_hilang/widget/jawaban_salah.dart';

class MencariAngkaHilangController extends GetxController {
  MencariAngkaHilangView? view;

  List<String> tempArrayQuestion = [];
  List<String> tempArrayAnswerChoice = [];
  List<String> tempArrayAnswer = [];

  int lengthLatihan = 0;

//examples var
  List<String> arrayAnswer = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  List<String> arrayAnswerChoice = [
    '4',
    '3',
    '9',
  ];
  List<String> question = ['1', '2', '_', '4', '5'];

  // List<String> arrayAnswer = []; // Value received from backend
  // List<String> arrayAnswerChoice = []; // Value received from backend
  // List<String> question = []; // Value received from backend

  bool answerBool = false;

  List<List<String>> questionHistory = [];
  List<List<String>> answerChoiceHistory = [];

  void checkAnswer() {
    if (!tempArrayQuestion.contains('_') &&
        isMatched(tempArrayQuestion, arrayAnswer)) {
      answerBool = true; // Set all elements to true
      update();
    } else if (!tempArrayQuestion.contains('_')) {
      Get.to(const JawabanSalahMencarianAngkaHilang());
    }
  }

  bool isMatched(List<String> list1, List<String> list2) {
    if (list1.length != list2.length) {
      return false;
    }

    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) {
        return false;
      }
    }

    return true;
  }

  void removeAnswerChoice(int index, String text) {
    List<String> tempQuestionCopy = List.from(tempArrayQuestion);
    List<String> tempAnswerChoiceCopy = List.from(tempArrayAnswerChoice);

    for (int i = 0; i < tempQuestionCopy.length; i++) {
      if (tempQuestionCopy[i] == '_') {
        tempQuestionCopy[i] = text;
        tempAnswerChoiceCopy = List.from(tempAnswerChoiceCopy)..removeAt(index);
        break;
      }
    }

    questionHistory.add(List.from(tempArrayQuestion));
    answerChoiceHistory.add(List.from(
        tempArrayAnswerChoice)); // Store a copy of tempArrayAnswerChoice
    tempArrayQuestion = List.from(tempQuestionCopy);
    tempArrayAnswerChoice =
        List.from(tempAnswerChoiceCopy); // Update tempArrayAnswerChoice
    update();
  }

  void undoAnswerChoice() {
    if (questionHistory.isNotEmpty && answerChoiceHistory.isNotEmpty) {
      tempArrayQuestion = List.from(questionHistory.last);
      questionHistory.removeLast();

      tempArrayAnswerChoice = List.from(
          answerChoiceHistory.last); // Restore from answerChoiceHistory
      answerChoiceHistory.removeLast();

      update();
    }
  }

  @override
  void onInit() {
    tempArrayQuestion = List.from(question);
    tempArrayAnswer = List.from(arrayAnswer);
    tempArrayAnswerChoice = List.from(arrayAnswerChoice);
    super.onInit();
  }
}
