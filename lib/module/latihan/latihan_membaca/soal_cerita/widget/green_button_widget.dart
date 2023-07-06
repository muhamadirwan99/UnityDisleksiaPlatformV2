// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class GreenButtonWidget extends StatefulWidget {
  final String title;
  final VoidCallback callback;
  const GreenButtonWidget(
      {Key? key, required this.title, required this.callback})
      : super(key: key);

  @override
  State<GreenButtonWidget> createState() => _GreenButtonWidgetState();
}

class _GreenButtonWidgetState extends State<GreenButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: blue400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: widget.callback,
      child: Center(
        child: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
                color: neutralBlack),
          ),
        ),
      ),
    );
  }
}
