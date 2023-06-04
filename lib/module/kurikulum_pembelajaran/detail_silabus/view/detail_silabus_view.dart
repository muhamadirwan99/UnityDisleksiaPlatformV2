import 'dart:async';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/model/kurikulum_model.dart';
import 'package:udp_v2/core.dart';

class DetailSilabusView extends StatelessWidget {
  final Kurikulum dataKurikulum;
  final String title;
  const DetailSilabusView({
    Key? key,
    required this.dataKurikulum,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailSilabusController>(
      init: DetailSilabusController(),
      builder: (controller) {
        controller.view = this;
        controller.loadPDFs(dataKurikulum.linkPdf);
        final Completer<PDFViewController> controllerPdf =
            Completer<PDFViewController>();
        int? pagesPdf = 0;
        int? currentPage = 0;
        bool isReady = false;
        String errorMessage = '';

        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          floatingActionButton: InkWell(
            onTap: () {
              Get.to(DetailPdfView(
                path: controller.remotePDFpath,
                title: title,
                dataKurikulum: dataKurikulum,
              ));
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Container(
                height: 58,
                decoration: const BoxDecoration(
                  color: blue500,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      5.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/icon_silabus.svg"),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "File $title",
                            style: labelLarge.copyWith(color: neutralWhite),
                          ),
                          const SizedBox(
                            height: 1.0,
                          ),
                          Text(
                            "Detail dari $title ${dataKurikulum.title}",
                            style: bodySmall.copyWith(color: neutralWhite),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: Stack(
            children: [
              controller.remotePDFpath.isNotEmpty
                  ? PDFView(
                      filePath: controller.remotePDFpath,
                      enableSwipe: false,
                      swipeHorizontal: false,
                      autoSpacing: true,
                      pageFling: true,
                      pageSnap: true,
                      defaultPage: currentPage,
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
