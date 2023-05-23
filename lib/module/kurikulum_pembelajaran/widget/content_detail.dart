import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/kurikulum_pembelajaran/widget/pdf_viewer.dart';

class ContentDetail extends StatefulWidget {
  final String appBarTitle;
  final String title;
  final int index;
  const ContentDetail(
      {Key? key,
      required this.appBarTitle,
      required this.title,
      required this.index})
      : super(key: key);

  @override
  State<ContentDetail> createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail> {
  @override
  Widget build(BuildContext context) {
    String urlPDFPath = "";
    bool exists = true;
    int _totalPages = 0;
    int _currentPage = 0;
    bool pdfReady = false;
    late PDFViewController pdfViewController;
    bool loaded = false;
    KurikulumPembelajaranController.instance.requestPermission;
    KurikulumPembelajaranController.instance
        .getFileFromUrl("http://www.africau.edu/images/default/sample.pdf")
        .then(
          (value) => {
            setState(() {
              if (value != null) {
                urlPDFPath = value.path;
                loaded = true;
                exists = true;
              } else {
                exists = false;
              }
            })
          },
        );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
        backgroundColor: blue600,
        elevation: 0,
      ),
      floatingActionButton: InkWell(
        onTap: () {
          print("object");

          Get.to(PDFViewer(
              appBarTitle: widget.appBarTitle,
              title: widget.title,
              index: widget.index));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Container(
            height: 58,
            decoration: const BoxDecoration(
              color: blue600,
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
                        "File ${widget.title}",
                        style: labelLarge.copyWith(color: neutralWhite),
                      ),
                      Text(
                        "Detail dari ${widget.title} ${widget.appBarTitle}",
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.72,
              child: PDFView(
                filePath: urlPDFPath,
                autoSpacing: true,
                enableSwipe: true,
                pageSnap: true,
                swipeHorizontal: true,
                nightMode: false,
                onError: (e) {
                  //Show some error message or UI
                },
                onRender: (_pages) {
                  setState(() {
                    _totalPages = _pages!;
                    pdfReady = true;
                  });
                },
                onViewCreated: (PDFViewController vc) {
                  setState(() {
                    pdfViewController = vc;
                  });
                },
                onPageChanged: (int? page, int? total) {
                  setState(() {
                    _currentPage = page!;
                  });
                },
                onPageError: (page, e) {},
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
