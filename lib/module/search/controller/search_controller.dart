import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../view/search_view.dart';

class SearchController extends GetxController {
  SearchView? view;

  String query = "";
  Map<String, dynamic> data = {};
  List<Map<String, dynamic>> extractedDataList = [];

  List<Map<String, dynamic>> filteredList = [];

  getData() async {
    var collection = FirebaseFirestore.instance.collection('informasi');
    var querySnapshot = await collection.get();
    extractedDataList = [];
    for (var doc in querySnapshot.docs) {
      data = doc.data();

      data.forEach((key, value) {
        Map<String, dynamic> extractedData = {
          "date": value["date"],
          "desc": value["desc"],
          "image": value["image"],
          "link": value["link"],
          "title": value["title"],
        };
        extractedDataList.add(extractedData);
      });
    }
  }

  filterData() {
    filteredList = [];
    update();
    filteredList = extractedDataList
        .where((data) => data["title"]
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
  }
}
