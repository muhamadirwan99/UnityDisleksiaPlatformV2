import 'dart:io';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../view/kurikulum_pembelajaran_view.dart';
import 'package:permission_handler/permission_handler.dart';

class KurikulumPembelajaranController extends GetxController {
  static KurikulumPembelajaranController instance =
      KurikulumPembelajaranController();
  KurikulumPembelajaranView? view;

  String title = "";
  Future<File> getFileFromUrl(String url, {name}) async {
    var fileName = 'testonline';
    if (name != null) {
      fileName = name;
    }
    try {
      var data = await http.get(Uri.parse(url));
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/" + fileName + ".pdf");
      print("dir.path");
      print(dir.path);
      File urlFile = await file.writeAsBytes(bytes);
      update();
      return urlFile;
    } catch (e) {
      update();
      throw Exception("Error opening url file");
    }
  }

  void requestPermission() async {
    await Permission.storage.request();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
