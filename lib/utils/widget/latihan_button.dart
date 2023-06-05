// ignore_for_file: camel_case_types
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class LatihanButton extends StatefulWidget {
  final Color color;
  final Function() onPressed;
  final String icon;
  final String title;
  final String subtitle;

  const LatihanButton({
    Key? key,
    required this.color,
    required this.onPressed,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  State<LatihanButton> createState() => _LatihanButtonState();
}

class _LatihanButtonState extends State<LatihanButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onPressed: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SvgPicture.asset(
              widget.icon,
              color: gray100,
              height: 60,
              width: 60,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0,
                          color: gray100),
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.25,
                          color: gray100),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
