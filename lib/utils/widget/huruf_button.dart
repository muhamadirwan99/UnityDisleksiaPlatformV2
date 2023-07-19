// ignore_for_file: unnecessary_import

import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/latihan/latihan_huruf_page.dart';

class HurufButton extends StatelessWidget {
  final String value;

  const HurufButton({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: blue500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          Get.to(LatihanHurufPage(value: value));
        },
        child: Text(
          value,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 0,
                color: gray100),
          ),
        ),
      ),
    );
  }
}
