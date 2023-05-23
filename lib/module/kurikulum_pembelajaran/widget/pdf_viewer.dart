import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:udp_v2/core.dart';

class PDFViewer extends StatefulWidget {
  final String appBarTitle;
  final String title;
  final int index;
  const PDFViewer(
      {Key? key,
      required this.appBarTitle,
      required this.title,
      required this.index})
      : super(key: key);

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  @override
  Widget build(BuildContext context) {
    String urlPDFPath = "";
    bool exists = true;
    int _totalPages = 0;
    int _currentPage = 0;
    bool pdfReady = false;
    late PDFViewController pdfViewController;
    bool loaded = false;
    setState(() {
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
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
        actions: [
          InkWell(
            onTap: () {
              print("object");
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
        backgroundColor: blue600,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
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
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      if (_currentPage > 0) {
                        _currentPage--;
                        pdfViewController.setPage(_currentPage);
                      }
                    });
                  },
                ),
                Text(
                  "${_currentPage + 1}/$_totalPages",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (_currentPage < _totalPages - 1) {
                        _currentPage++;
                        pdfViewController.setPage(_currentPage);
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 1.4142,
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
            ),
          ],
        ),
      ),
    );
  }
}
