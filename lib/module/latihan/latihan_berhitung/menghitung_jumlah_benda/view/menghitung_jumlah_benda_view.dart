// ignore_for_file: prefer_null_aware_operators

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class MenghitungJumlahBendaView extends StatelessWidget {
  const MenghitungJumlahBendaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenghitungJumlahBendaController>(
      init: MenghitungJumlahBendaController(),
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
                  .doc("menghitungjumlahbenda")
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
                  controller.image =
                      dataList[0][controller.lengthLatihan]["image"];
                  controller.title =
                      dataList[0][controller.lengthLatihan]["title"];
                  controller.soal =
                      dataList[0][controller.lengthLatihan]["soal"] ?? "";
                }
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          controller.title,
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
                        controller.soal.isNotEmpty
                            ? Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    child: Text(
                                      controller.soal,
                                      style: titleSmall.copyWith(height: 1.5),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              )
                            : Container(),
                        FancyShimmerImage(
                          imageUrl: controller.image,
                          height: 200.0,
                          boxFit: BoxFit.fitWidth,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Pilih jawaban yang Tepat!',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                                color: neutralBlack),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Wrap(
                                alignment: WrapAlignment.center,
                                runSpacing: 8,
                                spacing: 8,
                                children: List.generate(
                                    controller.tempArrayAnswerChoice.length,
                                    (index) => InkWell(
                                          onTap: () {
                                            controller.tempAnswer = controller
                                                .tempArrayAnswerChoice[index];
                                            controller.update();
                                            if (controller.tempAnswer.contains(
                                                controller.realAnswer)) {
                                              controller.lengthLatihan++;
                                              if (controller.lengthLatihan <
                                                  dataList[0].length) {
                                                controller.arrayAnswerChoice =
                                                    dataList[0][controller
                                                            .lengthLatihan]
                                                        ["arrayAnswer"];
                                                controller.realAnswer =
                                                    dataList[0][controller
                                                            .lengthLatihan]
                                                        ["realAnswer"];
                                                controller
                                                        .tempArrayAnswerChoice =
                                                    List.from(controller
                                                        .arrayAnswerChoice);
                                                controller.update();
                                              } else {
                                                Get.offAll(
                                                  const FinishPageMencariAngkaYangHilang(
                                                      kdKelas: "1"),
                                                );
                                              }
                                            } else {
                                              Get.to(
                                                  const JawabanSalahMenghitungAngka());
                                            }
                                          },
                                          child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: const BoxDecoration(
                                                  color: blue500,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                      4,
                                                    ),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    controller
                                                            .tempArrayAnswerChoice[
                                                        index],
                                                    style: GoogleFonts.roboto(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 28,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              letterSpacing:
                                                                  0.2,
                                                              color:
                                                                  neutralWhite),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
