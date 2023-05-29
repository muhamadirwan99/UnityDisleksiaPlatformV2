import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class CardModul extends StatefulWidget {
  final dynamic data;

  const CardModul({Key? key, required this.data}) : super(key: key);

  @override
  State<CardModul> createState() => _CardModulState();
}

class _CardModulState extends State<CardModul> {
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

  final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = DownloadTaskStatus(data[1]);
      int progress = data[2];
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              "Modul " + widget.data["namaMapel"],
              style: titleMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                download(widget.data["linkModul"]);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: blue500,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 8, bottom: 8),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Unduh",
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: gray100),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.download,
                      size: 16,
                      color: neutralWhite,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
