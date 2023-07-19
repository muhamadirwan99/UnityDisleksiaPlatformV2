import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class AngkaButton extends StatelessWidget {
  final String value;

  const AngkaButton({Key? key, required this.value}) : super(key: key);

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
          Get.to(LatihanAngkaPage(value: value));
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
