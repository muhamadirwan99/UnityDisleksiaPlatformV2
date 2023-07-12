// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class FinishPageMencariCaraLain extends StatefulWidget {
  final String kdKelas;

  const FinishPageMencariCaraLain({
    Key? key,
    required this.kdKelas,
  }) : super(key: key);

  @override
  State<FinishPageMencariCaraLain> createState() =>
      _FinishPageMencariCaraLainState();
}

class _FinishPageMencariCaraLainState extends State<FinishPageMencariCaraLain> {
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
              'assets/images/materi_membedakan_huruf_finish_page.svg',
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Yeay! Kamu sudah latihan hari ini.\nTetap semangat!',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 16,
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
                Get.offAll(LatihanBerhitungView(
                  kdKelas: widget.kdKelas,
                ));
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
