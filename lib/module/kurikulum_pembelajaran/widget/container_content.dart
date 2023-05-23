import 'package:flutter_svg/flutter_svg.dart';
import 'package:udp_v2/core.dart';

class ContainerContent extends StatefulWidget {
  final String titleLabel;
  final String subtitleLabel;
  final String pathSvg;
  const ContainerContent(
      {super.key,
      required this.titleLabel,
      required this.subtitleLabel,
      required this.pathSvg});

  @override
  State<ContainerContent> createState() => _ContainerContentState();
}

class _ContainerContentState extends State<ContainerContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration:
          BoxDecoration(color: blue600, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 14),
        child: Row(
          children: [
            SvgPicture.asset(widget.pathSvg),
            SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.titleLabel,
                  style: labelLarge.copyWith(color: neutralWhite),
                ),
                Text(
                  widget.subtitleLabel,
                  style: bodySmall.copyWith(color: neutralWhite),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
