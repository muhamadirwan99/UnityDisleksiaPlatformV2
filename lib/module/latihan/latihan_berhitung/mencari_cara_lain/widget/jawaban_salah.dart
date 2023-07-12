// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class JawabanSalahMencariCaraLain extends StatefulWidget {
  const JawabanSalahMencariCaraLain({Key? key}) : super(key: key);

  @override
  State<JawabanSalahMencariCaraLain> createState() =>
      _JawabanSalahMencariCaraLainState();
}

class _JawabanSalahMencariCaraLainState
    extends State<JawabanSalahMencariCaraLain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/materi_membedakan_huruf_salah.svg',
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Jawabanmu kurang tepat!',
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
                Get.back();
              },
              child: Text(
                'Kembali',
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
    );
  }
}
