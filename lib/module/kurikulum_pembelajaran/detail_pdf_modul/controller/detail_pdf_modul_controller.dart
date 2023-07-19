import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../view/detail_pdf_modul_view.dart';

class DetailPdfModulController extends GetxController {
  DetailPdfModulView? view;

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

  Future download(String url) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final baseStorage = await getExternalStorageDirectory();

      await FlutterDownloader.enqueue(
        url: url,
        savedDir: baseStorage!.path,
        showNotification: true,
        openFileFromNotification: true,
        saveInPublicStorage: true,
      );
    }
  }

  final ReceivePort port = ReceivePort();

  @override
  void onInit() {
    super.onInit();
    IsolateNameServer.registerPortWithName(
        port.sendPort, 'downloader_send_port');
    port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = DownloadTaskStatus(data[1]);
      int progress = data[2];
      update();
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }
}
