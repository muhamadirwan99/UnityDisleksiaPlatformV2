// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core_package.dart';

class TextFieldWidget extends StatefulWidget {
  final double width;
  final String text;
  final Color color;
  const TextFieldWidget(
      {Key? key, required this.text, required this.width, required this.color})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            4,
          ),
        ),
      ),
      child: Center(
        child: Text(
          widget.text,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
                color: neutralWhite),
          ),
        ),
      ),
    );
  }
}
