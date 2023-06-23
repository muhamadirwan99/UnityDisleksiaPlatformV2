import 'package:get/get.dart';
import '../view/menjodohkan_kata_view.dart';

class MenjodohkanKataController extends GetxController {
  MenjodohkanKataView? view;

  late List<ItemModel> items;
  late List<ItemModel> items2;
  late bool gameOver;

  initGame() {
    gameOver = false;
    items = [
      ItemModel(nameAbjad: "A", name: "a", value: "a"),
      ItemModel(nameAbjad: "E", name: "e", value: "e"),
      ItemModel(nameAbjad: "I", name: "i", value: "i"),
      ItemModel(nameAbjad: "U", name: "u", value: "u"),
      ItemModel(nameAbjad: "O", name: "o", value: "o"),
      ItemModel(nameAbjad: "B", name: "b", value: "b"),
      ItemModel(nameAbjad: "C", name: "c", value: "c"),
      ItemModel(nameAbjad: "D", name: "d", value: "d"),
      ItemModel(nameAbjad: "F", name: "f", value: "f"),
      ItemModel(nameAbjad: "G", name: "g", value: "g"),
    ];
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  @override
  void onInit() {
    super.onInit();
    initGame();
  }
}

class ItemModel {
  final String name;
  final String value;
  final String nameAbjad;
  bool accepting;

  ItemModel(
      {required this.name,
      required this.value,
      required this.nameAbjad,
      this.accepting = false});
}
