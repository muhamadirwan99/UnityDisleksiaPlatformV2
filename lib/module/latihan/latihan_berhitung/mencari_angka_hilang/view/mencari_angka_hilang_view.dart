// ignore_for_file: prefer_null_aware_operators

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class MencariAngkaHilangView extends StatelessWidget {
  const MencariAngkaHilangView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MencariAngkaHilangController>(
      init: MencariAngkaHilangController(),
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
                    .doc("mencariangka")
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

                  return SingleChildScrollView(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Lengkapilah angka yang hilang !',
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
                            alignment: Alignment.center,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  runSpacing: 8,
                                  spacing: 8,
                                  children: List.generate(
                                    controller.tempArrayQuestion.length,
                                    (index) => InkWell(
                                      onTap: controller.answerBool
                                          ? null
                                          : () {
                                              controller.undoAnswerChoice();
                                            },
                                      child: Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Container(
                                            width: 60,
                                            height: 60,
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
                                                controller
                                                    .tempArrayQuestion[index],
                                                style: GoogleFonts.roboto(
                                                  textStyle: const TextStyle(
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 0.2,
                                                      color: neutralWhite),
                                                ),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Pilihlah angka yang Tepat',
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
                                      (index) => GestureDetector(
                                            onTap: controller.answerBool
                                                ? null
                                                : () {
                                                    controller.removeAnswerChoice(
                                                        index,
                                                        controller
                                                                .tempArrayAnswerChoice[
                                                            index]);
                                                    controller.checkAnswer();
                                                  },
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration:
                                                      const BoxDecoration(
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
                                        dataList![0].length) {
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
                                          List.from(
                                              controller.arrayAnswerChoice);
                                      controller.update();
                                    } else {
                                      Get.offAll(
                                        const FinishPageMencariAngkaYangHilang(
                                            kdKelas: "1"),
                                      );
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
                      ),
                    ),
                  );
                }));
      },
    );
  }
}
