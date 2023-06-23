import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:get/get.dart';

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
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Lengkapilah Angka Yang Hilang!',
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
                  height: 80,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.tempArrayQuestion.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextFieldWidget(
                            color: blue400,
                            width: 48,
                            text: controller.tempArrayQuestion[index]),
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
                  height: 80,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.tempArrayAnswerChoice.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          controller.removeAnswerChoice(
                              index, controller.tempArrayAnswerChoice[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextFieldWidget(
                              width: 48,
                              color: blue400,
                              text: controller.tempArrayAnswerChoice[index]),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    controller.cancelAnswerChoice();
                  },
                  child: const Text("Save"),
                ),
              ],
            ));
      },
    );
  }
}
