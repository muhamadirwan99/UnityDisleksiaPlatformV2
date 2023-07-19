// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class JawabanBenarMencariCaraLain extends StatefulWidget {
  final String kdKelas;
  final MencariCaraLainController controller;

  const JawabanBenarMencariCaraLain(
      {Key? key, required this.kdKelas, required this.controller})
      : super(key: key);

  @override
  State<JawabanBenarMencariCaraLain> createState() =>
      _JawabanBenarMencariCaraLainState();
}

class _JawabanBenarMencariCaraLainState
    extends State<JawabanBenarMencariCaraLain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue100,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/materi_membedakan_huruf_benar.svg',
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Jawabanmu tepat!',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.2,
                      color: neutralBlack),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blue300,
                ),
                onPressed: () {
                  // widget.controller.answerList = [];
                  widget.controller.periksaJawabanBool = false;
                  widget.controller.update();
                  Get.to(FinishPageMencariCaraLain(
                    kdKelas: widget.kdKelas,
                  ));
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
