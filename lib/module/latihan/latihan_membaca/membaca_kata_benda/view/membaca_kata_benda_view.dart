import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class MembacaKataBendaView extends StatelessWidget {
  const MembacaKataBendaView({Key? key}) : super(key: key);

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
            body: Column(
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
                Image.network(
                  "https://images.unsplash.com/photo-1484517586036-ed3db9e3749e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                  height: 160,
                  fit: BoxFit.cover,
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

                      if (controller.tempArrayQuestion[index].length < 8) {
                        width =
                            controller.tempArrayQuestion[index].length * 48.0;
                      } else {
                        width =
                            controller.tempArrayQuestion[index].length * 36.0;
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

                      if (controller.tempArrayAnswerChoice[index].length < 8) {
                        width = controller.tempArrayAnswerChoice[index].length *
                            48.0;
                      } else {
                        width = controller.tempArrayAnswerChoice[index].length *
                            36.0;
                      }
                      return InkWell(
                        onTap: controller.answerBool
                            ? null
                            : () {
                                controller.removeAnswerChoice(index,
                                    controller.tempArrayAnswerChoice[index]);
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
                          controller.answerBool = false;
                          controller.update();
                          Get.back();
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
            ));
      },
    );
  }
}
