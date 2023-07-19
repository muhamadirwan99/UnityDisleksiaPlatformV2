// ignore_for_file: camel_case_types, deprecated_member_use
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udp_v2/core.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({
    Key? key,
  }) : super(key: key);

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        "assets/images/beranda_off.svg",
        color: neutralWhite,
        height: 21,
        width: 21,
      ),
      onPressed: () {
        Get.offAll(const MenuNavView());
      },
    );
  }
}
