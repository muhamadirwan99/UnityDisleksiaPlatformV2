import 'package:flutter_svg/flutter_svg.dart';
import 'package:udp_v2/core.dart';

class TidakAdaHasilWidget extends StatefulWidget {
  const TidakAdaHasilWidget({Key? key}) : super(key: key);

  @override
  State<TidakAdaHasilWidget> createState() => _TidakAdaHasilWidgetState();
}

class _TidakAdaHasilWidgetState extends State<TidakAdaHasilWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/images/globe.svg",
          height: 120,
          width: 120,
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          "Silakan cari media pembelajaran",
          style: titleMedium.copyWith(color: blue800),
        ),
      ],
    );
  }
}
