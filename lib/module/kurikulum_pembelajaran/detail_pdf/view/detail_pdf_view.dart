import 'dart:async';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:udp_v2/core.dart';
import 'package:get/get.dart';
import 'package:udp_v2/utils/show_info_dialog%20copy.dart';

class DetailPdfView extends StatelessWidget {
  final String path;
  final String title;
  final String linkPdf;

  const DetailPdfView({
    Key? key,
    required this.path,
    required this.title,
    required this.linkPdf,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Completer<PDFViewController> controllerPdf =
        Completer<PDFViewController>();
    int? currentPage = 0;
    bool isReady = false;
    String errorMessage = '';

    return GetBuilder<DetailPdfController>(
      init: DetailPdfController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            actions: [
              InkWell(
                onTap: () {
                  controller.download(linkPdf);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(
                    Icons.file_download_sharp,
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              PDFView(
                filePath: path,
                enableSwipe: true,
                swipeHorizontal: false,
                autoSpacing: true,
                pageFling: true,
                pageSnap: true,
                defaultPage: currentPage!,
                fitPolicy: FitPolicy.BOTH,
                preventLinkNavigation:
                    false, // if set to true the link is handled in flutter
                onRender: (pagess) {
                  isReady = true;
                  controller.update();
                },
                onError: (error) {
                  showErrorDialog(
                      "Terjadi Masalah Pada Koneksi Anda!!!\nSilahkan Muat Ulang !!!");
                  controller.update();
                },
                onPageError: (page, error) {
                  showErrorDialog(
                      "Terjadi Masalah Pada Koneksi Anda!!!\nSilahkan Muat Ulang !!!");
                  controller.update();
                },
                onViewCreated: (PDFViewController pdfViewController) {
                  controllerPdf.complete(pdfViewController);
                },
                onLinkHandler: (String? uri) {},
                onPageChanged: (int? page, int? total) {
                  currentPage = page;
                  controller.update();
                },
              ),
              errorMessage.isEmpty
                  ? !isReady
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container()
                  : Center(
                      child: Text(errorMessage),
                    )
            ],
          ),
        );
      },
    );
  }
}
