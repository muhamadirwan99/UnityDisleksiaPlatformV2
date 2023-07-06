import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:get/get.dart';
import 'package:udp_v2/module/latihan/latihan_membaca/soal_cerita/widget/green_button_widget.dart';

class SoalCeritaView extends StatelessWidget {
  final String question;
  const SoalCeritaView({Key? key, required this.question}) : super(key: key);

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
          body: SingleChildScrollView(
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
                    Image.network(
                      controller.imageLink1,
                      width: MediaQuery.of(context).size.width - 29,
                      height: 200,
                      fit: BoxFit.cover,
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
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return GreenButtonWidget(
                            title: controller.answerChoice1[index],
                            callback: () {
                              controller.answer1 =
                                  controller.answerChoice1[index];
                              controller.update();
                              controller.checkAnswer();
                            });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
