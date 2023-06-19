import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/utils/show_info_dialog.dart';
import 'package:udp_v2/utils/widget/action_button.dart';
import 'package:udp_v2/core.dart';

class MencariHurufVokalKonsonanView extends StatelessWidget {
  final String kdKelas;

  const MencariHurufVokalKonsonanView({
    Key? key,
    required this.kdKelas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MencariHurufVokalKonsonanController>(
      init: MencariHurufVokalKonsonanController(),
      builder: (controller) {
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("latihan")
                .doc("vokalkonsonan")
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
                controller.gambar =
                    dataList[0][controller.lengthLatihan]["gambar"];
              }
              return Scaffold(
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
                  body: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Manakah huruf vokal di bawah ini!',
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
                        Image.network(
                          controller.gambar,
                          width: 300.0,
                          height: 300.0,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.letter.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  if (controller
                                      .isVokal(controller.letter[index])) {
                                    controller.changeValue(index);
                                  } else {
                                    showInfoDialog(
                                        'Jawaban kamu kurang tepat!');
                                  }

                                  if (listEquals(controller.isVokalList,
                                      controller.isVokalListAwnser)) {
                                    controller.lengthLatihan++;

                                    if (controller.lengthLatihan <
                                        dataList[0].length) {
                                      controller.letter = dataList[0]
                                          [controller.lengthLatihan]["title"];
                                      controller.isVokalList.assignAll(
                                          List<bool>.generate(
                                              controller.letter.length,
                                              (index) => false));
                                      controller
                                          .findAwnserValue(controller.letter);
                                    } else {
                                      Get.to(FinalPageVokalKonsonanWidget(
                                        kdKelas: kdKelas,
                                      ));
                                    }
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Container(
                                    width: 32,
                                    decoration: BoxDecoration(
                                      color: controller.isVokalList[index]
                                          ? yellow500
                                          : blue400,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          4,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        controller.letter[index],
                                        style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.2,
                                              color: neutralWhite),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );

                              // TextFieldWidget(
                              //   text: controller.letter[index],
                              //   width: 32,
                              //   color: controller.isVokalList[index]
                              //       ? yellow500
                              //       : blue400,
                              // )),
                              // );
                            },
                          ),
                        ),
                      ],
                    ),
                  ));
            });
      },
    );
  }
}
