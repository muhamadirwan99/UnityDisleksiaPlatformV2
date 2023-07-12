import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/latihan/latihan_membaca/soal_cerita/widget/green_button_widget.dart';
import 'package:udp_v2/module/latihan/latihan_membaca/soal_cerita/widget/jawaban_salah.dart';

class SoalCeritaView extends StatelessWidget {
  final String kdKelas;
  const SoalCeritaView({
    Key? key,
    required this.kdKelas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SoalCeritaController>(
      init: SoalCeritaController(),
      builder: (controller) {
        controller.view = this;
        return Scaffold(
          backgroundColor: blue100,
          appBar: AppBar(
            title: Text(
              'Latihan',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                    color: gray100),
              ),
            ),
            titleTextStyle: const TextStyle(color: gray900),
            elevation: 0,
            backgroundColor: blue500,
            actions: const [
              ActionButton(),
            ],
          ),
          body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("latihan")
                  .doc("soalcerita")
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }
                DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
                    snapshot.data!;
                Map<String, dynamic>? data = documentSnapshot.data();

                List<dynamic>? dataList =
                    data != null ? data.values.toList() : null;

                if (controller.lengthLatihan < dataList![0].length) {
                  controller.imageLink1 =
                      dataList[0][controller.lengthLatihan]["image"];
                  controller.question1 =
                      dataList[0][controller.lengthLatihan]["question"] ?? "";
                }
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Jawablah dengan saksama!',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.2,
                                  color: neutralBlack),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          FancyShimmerImage(
                            imageUrl: controller.imageLink1,
                            height: 300.0,
                            boxFit: BoxFit.fitWidth,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            controller.question1,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.2,
                                  color: neutralBlack),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            itemCount: controller.answerChoice1.length,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return GreenButtonWidget(
                                  title: controller.answerChoice1[index],
                                  callback: () {
                                    controller.answer1 =
                                        controller.answerChoice1[index];
                                    controller.update();
                                    if (controller.answer1
                                        .contains(controller.realAnswer1)) {
                                      controller.lengthLatihan++;
                                      if (controller.lengthLatihan <
                                          dataList[0].length) {
                                        controller.answerChoice1 = dataList[0]
                                                [controller.lengthLatihan]
                                            ["arrayAnswer"];
                                        controller.realAnswer1 = dataList[0]
                                                [controller.lengthLatihan]
                                            ["answer"];
                                        controller.update();
                                      } else {
                                        controller.lengthLatihan = 0;
                                        Get.to(FinishPageMembedakanHuruf(
                                            kdKelas: kdKelas));
                                      }
                                    } else {
                                      Get.to(
                                          const JawabanSalahMenjawabSoalCerita());
                                    }
                                  });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
