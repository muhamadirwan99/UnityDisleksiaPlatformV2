import 'dart:math';

import 'package:get/get.dart';
import 'package:udp_v2/core.dart';

class MencariCaraLainController extends GetxController {
  MencariCaraLainView? view;

  List<dynamic> listTextEditingController = [];
  List<dynamic> listFocusNode = [];
  String title = "Hitunglah jumlah burung di bawah ini!";
  String image =
      "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fburung.png?alt=media&token=bab8b74b-6a9b-473e-8aa4-05f1d05e2e4a";
  List<dynamic> question = [
    "3",
    "x",
    "2",
    "=",
  ];
  int lengthLatihan = 0;

  RxList<dynamic> answerPlaceHolder =
      <dynamic>["_", "+", "_", "+", "_", "=", "_"].obs;
  double answer = 6;
  RxList<dynamic> answerList = <dynamic>[].obs;

  bool periksaJawabanBool = false;

  bool isNumber(String input) {
    if (input.isNotEmpty) {
      if (RegExp(r'[0-9]').hasMatch(input)) {
        return true;
      }
    }
    return false;
  }

  bool isNotOperator(String input) {
    if (!input.contains("_")) {
      return true;
    }
    return false;
  }

  bool isNotEmpty(List<String> input) {
    if (!input.contains("_")) {
      return true;
    }
    return false;
  }

  double calculateMath(List<String> answer) {
    final Map<String, int> precedence = {
      '+': 1,
      '-': 1,
      ':': 2,
      'x': 2,
    };

    double result;
    String operator;
    List<double> numbers = [];
    List<String> operators = [];

    void performOperation() {
      double number2 = numbers.removeLast();
      double number1 = numbers.removeLast();
      String op = operators.removeLast();

      switch (op) {
        case '+':
          numbers.add(number1 + number2);
          break;
        case '-':
          numbers.add(number1 - number2);
          break;
        case ':':
          numbers.add(number1 / number2);
          break;
        case 'x':
          numbers.add(number1 * number2);
          break;
      }
    }

    for (int i = 0; i < answer.length - 1; i++) {
      String currentElement = answer[i];

      if (currentElement == '+' ||
          currentElement == '-' ||
          currentElement == ':' ||
          currentElement == 'x') {
        // Operator
        if (operators.isEmpty) {
          operators.add(currentElement);
        } else {
          while (operators.isNotEmpty &&
              precedence[currentElement]! <= precedence[operators.last]!) {
            performOperation();
          }
          operators.add(currentElement);
        }
      } else if (isNumbeOperator(currentElement)) {
        // Check if the element is numeric
        // Operand (number)
        double number = double.parse(currentElement);
        numbers.add(number);
      }
    }

    while (operators.isNotEmpty) {
      performOperation();
    }

    result = numbers.first;
    return result;
  }

  bool isNumbeOperator(String input) {
    return double.tryParse(input) != null;
  }

  int sum(int a, int b) {
    return a + b;
  }

  double divide(double a, double b) {
    return a / b;
  }

  int multiply(int a, int b) {
    return a * b;
  }

  int findMin(int a, int b) {
    return min(a, b);
  }
}
