import 'dart:math';

import 'package:get/get.dart';
import '../view/mencari_cara_lain_view.dart';

class MencariCaraLainController extends GetxController {
  MencariCaraLainView? view;

  String title = "Hitunglah jumlah bunga di bawah ini!";
  List<String> question = [
    "2",
    "+",
    "2",
    "+",
    "2",
    "=",
    "6",
  ];

  List<String> answerPlaceHolder = ["_", "x", "_", "=", "_"];
  int answer = 6;
  List<String> answerList = [];

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
