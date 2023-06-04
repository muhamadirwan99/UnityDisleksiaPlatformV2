import 'dart:async';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:udp_v2/core.dart';
import 'package:get/get.dart';
import 'package:udp_v2/model/kurikulum_model.dart';

class DetailPdfView extends StatelessWidget {
  final String path;
  final Kurikulum dataKurikulum;
  final String title;

  const DetailPdfView({
    Key? key,
    required this.path,
    required this.dataKurikulum,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Completer<PDFViewController> controllerPdf =
        Completer<PDFViewController>();
    int? pagesPdf = 0;
    int? currentPage = 0;
    bool isReady = false;
    String errorMessage = '';

    return GetBuilder<DetailPdfController>(
      init: DetailPdfController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("$title ${dataKurikulum.title}"),
            actions: [
              InkWell(
                onTap: () {
                  controller.download(dataKurikulum.linkPdf);
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
                  pagesPdf = pagess;
                  isReady = true;
                  controller.update();
                },
                onError: (error) {
                  errorMessage = error.toString();
                  controller.update();

                  print(error.toString());
                },
                onPageError: (page, error) {
                  errorMessage = '$page: ${error.toString()}';
                  controller.update();

                  print('$page: ${error.toString()}');
                },
                onViewCreated: (PDFViewController pdfViewController) {
                  controllerPdf.complete(pdfViewController);
                },
                onLinkHandler: (String? uri) {
                  print('goto uri: $uri');
                },
                onPageChanged: (int? page, int? total) {
                  print('page change: $page/$total');

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
