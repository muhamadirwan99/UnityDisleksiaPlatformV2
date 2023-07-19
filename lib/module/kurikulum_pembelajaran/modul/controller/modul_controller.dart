import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import '../view/modul_view.dart';

class ModulController extends GetxController {
  ModulView? view;

  List<String> remotePDFpath = [];

  Future<File> createFileOfPdfUrl(String link, int length) async {
    Completer<File> completer = Completer();
    if (remotePDFpath.length < length) {
      try {
        var url = link;
        final filename = url.substring(url.lastIndexOf("/") + 1);
        var request = await HttpClient().getUrl(Uri.parse(url));
        var response = await request.close();
        var bytes = await consolidateHttpClientResponseBytes(response);
        var dir = await getApplicationDocumentsDirectory();
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

  loadPDFs(String link, int length) async {
    createFileOfPdfUrl(link, length).then((f) {
      remotePDFpath.add(f.path);
      update();
    });
  }
}
