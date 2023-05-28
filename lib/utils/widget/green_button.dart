// ignore_for_file: camel_case_types
import 'package:udp_v2/core.dart';

class GreenButton extends StatefulWidget {
  final String value;
  final Function() onPressed;

  const GreenButton({
    Key? key,
    required this.value,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<GreenButton> createState() => _GreenButtonState();
}

class _GreenButtonState extends State<GreenButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: blue500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: widget.onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            widget.value,
            style: titleMedium,
          ),
        ),
      ),
    );
  }
}
