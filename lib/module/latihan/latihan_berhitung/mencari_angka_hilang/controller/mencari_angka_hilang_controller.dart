import 'package:get/get.dart';
import '../view/mencari_angka_hilang_view.dart';

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
    '6',
  ];
  List<String> arrayAnswerChoice = [
    '11',
    '12',
    '3',
    '7',
    '9',
    '10',
    '1',
    '2',
    '5'
  ];
  List<String> question = ['1', '_', '3', '4', '_', '6'];

  // List<String> arrayAnswer = []; // Value received from backend
  // List<String> arrayAnswerChoice = []; // Value received from backend
  // List<String> question = []; // Value received from backend
  String image =
      "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fkaki.png?alt=media&token=8a00fd6d-795d-4be0-8a0a-b114497ef77b";
  bool answerBool = false;

  List<List<String>> questionHistory = [];
  List<List<String>> answerChoiceHistory = [];

  void checkAnswer() {
    if (!tempArrayQuestion.contains('_') &&
        isMatched(tempArrayQuestion, arrayAnswer)) {
      answerBool = true; // Set all elements to true
      update();
    } else if (!tempArrayQuestion.contains('_')) {
      print("Belum Benar");
      //Get.to(const JawabanSalahMencarianAngkaHilang());
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
