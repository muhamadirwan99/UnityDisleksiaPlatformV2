import 'package:udp_v2/core.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:flutter_pdfview/flutter_pdfview.dart';

class DetailPdfModulView extends StatelessWidget {
  final String linkPdf;
  const DetailPdfModulView({
    Key? key,
    required this.linkPdf,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPdfModulController>(
      init: DetailPdfModulController(),
      builder: (controller) {
        controller.view = this;
        controller.loadPDFs(linkPdf);
        final Completer<PDFViewController> controllerPdf =
            Completer<PDFViewController>();
        int? currentPage = 0;

        return Scaffold(
          appBar: AppBar(
            title: const Text("File Modul"),
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
              controller.remotePDFpath.isNotEmpty
                  ? PDFView(
                      filePath: controller.remotePDFpath,
                      enableSwipe: true,
                      swipeHorizontal: false,
                      autoSpacing: true,
                      pageFling: true,
                      pageSnap: true,
                      defaultPage: currentPage,
                      fitPolicy: FitPolicy.BOTH,
                      preventLinkNavigation:
                          false, // if set to true the link is handled in flutter
                      onRender: (pagess) {
                        controller.update();
                      },
                      onError: (error) {
                        controller.update();
                      },
                      onPageError: (page, error) {
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
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    )
              // errorMessage.isEmpty
              //     ? !isReady
              //         ? const Center(
              //             child: CircularProgressIndicator(),
              //           )
              //         : Container()
              //     : Center(
              //         child: Text(errorMessage),
              //       )
            ],
          ),
        );
      },
    );
  }
}
