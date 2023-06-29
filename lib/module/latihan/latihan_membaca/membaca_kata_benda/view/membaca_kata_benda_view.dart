import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class MembacaKataBendaView extends StatelessWidget {
  final String kdKelas;
  const MembacaKataBendaView({
    Key? key,
    required this.kdKelas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MembacaKataBendaController>(
      init: MembacaKataBendaController(),
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
                    .doc("membacakatabenda")
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
                        dataList[0][controller.lengthLatihan]["images"];
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Lengkapilah Huruf di Bawah Ini!',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.2,
                              color: neutralBlack),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      FancyShimmerImage(
                        imageUrl: controller.image,
                        height: 179,
                        boxFit: BoxFit.fitHeight,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 48,
                        alignment: Alignment.center,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.tempArrayQuestion.length,
                          itemBuilder: (BuildContext context, int index) {
                            double width;

                            if (controller.tempArrayQuestion[index].length <
                                8) {
                              width =
                                  controller.tempArrayQuestion[index].length *
                                      48.0;
                            } else {
                              width =
                                  controller.tempArrayQuestion[index].length *
                                      36.0;
                            }
                            return InkWell(
                              onTap: controller.answerBool
                                  ? null
                                  : () {
                                      controller.undoAnswerChoice();
                                    },
                              child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Container(
                                    width: width,
                                    decoration: const BoxDecoration(
                                      color: blue400,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          4,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        controller.tempArrayQuestion[index],
                                        style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.2,
                                              color: neutralWhite),
                                        ),
                                      ),
                                    ),
                                  )),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Pilihlah huruf yang Tepat',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.2,
                              color: neutralBlack),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 48,
                        alignment: Alignment.center,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.tempArrayAnswerChoice.length,
                          itemBuilder: (BuildContext context, int index) {
                            double width;

                            if (controller.tempArrayAnswerChoice[index].length <
                                8) {
                              width = controller
                                      .tempArrayAnswerChoice[index].length *
                                  48.0;
                            } else {
                              width = controller
                                      .tempArrayAnswerChoice[index].length *
                                  36.0;
                            }
                            return InkWell(
                              onTap: controller.answerBool
                                  ? null
                                  : () {
                                      controller.removeAnswerChoice(
                                          index,
                                          controller
                                              .tempArrayAnswerChoice[index]);
                                      controller.checkAnswer();
                                    },
                              child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Container(
                                    width: width,
                                    decoration: const BoxDecoration(
                                      color: blue400,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          4,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        controller.tempArrayAnswerChoice[index],
                                        style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.2,
                                              color: neutralWhite),
                                        ),
                                      ),
                                    ),
                                  )),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      controller.answerBool
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: blue300,
                              ),
                              onPressed: () {
                                controller.lengthLatihan++;

                                if (controller.lengthLatihan <
                                    dataList[0].length) {
                                  controller.answerBool = false;

                                  List<String> tempListQuestion =
                                      List<String>.from(dataList[0]
                                              [controller.lengthLatihan]
                                          ["question"] as List);
                                  List<String> tempListAnswer =
                                      List<String>.from(dataList[0]
                                              [controller.lengthLatihan]
                                          ["arrayAnswer"] as List);
                                  List<String> tempListAnswerChoice =
                                      List<String>.from(dataList[0]
                                              [controller.lengthLatihan]
                                          ["arrayAnswerChoice"] as List);

                                  controller.question = tempListQuestion;
                                  controller.arrayAnswer = tempListAnswer;
                                  controller.arrayAnswerChoice =
                                      tempListAnswerChoice;

                                  controller.tempArrayQuestion =
                                      List.from(controller.question);
                                  controller.tempArrayAnswer =
                                      List.from(controller.arrayAnswer);
                                  controller.tempArrayAnswerChoice =
                                      List.from(controller.arrayAnswerChoice);
                                  controller.tempArrayAnswerChoice2 =
                                      List.from(controller.arrayAnswerChoice);
                                  controller.tempArrayQuestion2 =
                                      List.from(controller.question);
                                  controller.update();
                                } else {
                                  Get.to(FinalPageVokalKonsonanWidget(
                                    kdKelas: kdKelas,
                                  ));
                                }
                              },
                              child: Text(
                                'Lanjut',
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.2,
                                      color: neutralBlack),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  );
                }));
      },
    );
  }
}
