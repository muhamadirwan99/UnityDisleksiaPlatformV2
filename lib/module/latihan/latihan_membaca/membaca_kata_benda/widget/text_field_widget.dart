// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core_package.dart';

class TextFieldWidget extends StatefulWidget {
  final String text;
  const TextFieldWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.0,
      width: 48.0,
      decoration: const BoxDecoration(
        color: blue400,
        borderRadius: BorderRadius.all(
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
