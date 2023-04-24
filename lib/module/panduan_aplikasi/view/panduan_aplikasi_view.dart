import 'package:flutter_svg/flutter_svg.dart';
import 'package:udp_v2/core.dart';
import 'package:get/get.dart';
import 'package:udp_v2/module/panduan_aplikasi/widget/panduan_paragraf_kedua_widget%20.dart';
import 'package:udp_v2/module/panduan_aplikasi/widget/panduan_paragraf_pertama_widget.dart';

class PanduanAplikasiView extends StatelessWidget {
  const PanduanAplikasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PanduanAplikasiController>(
      init: PanduanAplikasiController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: blue600,
          appBar: AppBar(
            backgroundColor: blue600,
            title: const Text("Panduan Aplikasi"),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                color: gray100,
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
              child: Column(
                children: [
                  const PanduanParagrafPertamaWidget(),
                  const SizedBox(
                    height: 8,
                  ),
                  const PanduanParagrafKeduaWidget()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
