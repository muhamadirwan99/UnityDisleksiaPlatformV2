import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';

class KurikulumView extends StatelessWidget {
  const KurikulumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KurikulumController>(
      init: KurikulumController(),
      builder: (controller) {
        controller.view = this;

        controller.loadPDFs(
            "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/modul%2FKurikulum%20Merdeka%20-%20Kepmendikbudristek%20No.56%20ttg%20Pedoman%20Penerapan%20Kurikulum.pdf?alt=media&token=5e933a9a-73cf-4b00-bb03-b019ec150ee0");

        return Scaffold(
          backgroundColor: neutralWhite,
          appBar: AppBar(
            title: const Text("Kurikulum"),
          ),
          floatingActionButton: InkWell(
            onTap: () {
              Get.to(DetailPdfView(
                path: controller.remotePDFpath,
                title: "File Kurikulum",
                linkPdf:
                    'https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/modul%2FKurikulum%20Merdeka%20-%20Kepmendikbudristek%20No.56%20ttg%20Pedoman%20Penerapan%20Kurikulum.pdf?alt=media&token=5e933a9a-73cf-4b00-bb03-b019ec150ee0',
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
                            "File Kurikulum",
                            style: labelLarge.copyWith(color: neutralWhite),
                          ),
                          const SizedBox(
                            height: 1.0,
                          ),
                          Text(
                            "Detail dari kurikulum merdeka",
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
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Kurikulum Pembelajaran",
                      style: headlineSmall.copyWith(
                        color: neutralBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "assets/images/image_kurikulum.png",
                    height: 200.0,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Kurikulum Merdeka adalah konsep pendidikan yang mengedepankan kebebasan dalam pembelajaran. Istilah ini muncul di Indonesia dan mencerminkan semangat kemerdekaan dalam pendidikan. Kurikulum Merdeka berusaha untuk mengurangi ketergantungan pada kurikulum formal yang ditetapkan oleh pemerintah dan memberikan ruang lebih besar bagi siswa untuk mengeksplorasi minat dan bakat mereka sendiri. Ide di balik Kurikulum Merdeka adalah memberikan kebebasan kepada siswa untuk mengatur dan merancang pendidikan mereka sendiri, dengan bimbingan guru sebagai fasilitator. Siswa diizinkan untuk memilih topik yang diminati dan belajar secara mandiri, mengeksplorasi berbagai sumber daya, dan berpartisipasi dalam proyek-proyek yang relevan dengan minat mereka.",
                    style:
                        bodyMedium.copyWith(color: neutralBlack, height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
