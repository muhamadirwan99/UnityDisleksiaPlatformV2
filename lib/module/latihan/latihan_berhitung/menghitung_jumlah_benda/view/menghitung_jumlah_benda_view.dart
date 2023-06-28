import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:get/get.dart';

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
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Hitung jumlah apel dibawah ini!',
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
                    "https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 40,
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
                                      controller.checkAnswer();
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: const BoxDecoration(
                                            color: blue500,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                4,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              controller
                                                  .tempArrayAnswerChoice[index],
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
                                  )),
                        ),
                      ],
                    ),
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
