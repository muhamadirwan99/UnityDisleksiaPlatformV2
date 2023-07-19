import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import '../view/kurikulum_view.dart';

class KurikulumController extends GetxController {
  KurikulumView? view;

  String remotePDFpath = "";

  Future<File> createFileOfPdfUrl(String link) async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    if (remotePDFpath.isEmpty) {
      try {
        var url = link;
        final filename = url.substring(url.lastIndexOf("/") + 1);
        var request = await HttpClient().getUrl(Uri.parse(url));
        var response = await request.close();
        var bytes = await consolidateHttpClientResponseBytes(response);
        var dir = await getApplicationDocumentsDirectory();
        print("Download files");
        print("${dir.path}/$filename");
        File file = File("${dir.path}/$filename");

        await file.writeAsBytes(bytes, flush: true);
        completer.complete(file);
      } catch (e) {
        throw Exception('Error parsing asset file!');
      }

      return completer.future;
    }
    return completer.future;
  }

  loadPDFs(String link) async {
    createFileOfPdfUrl(link).then((f) {
      remotePDFpath = f.path;
      update();
    });
  }
}
