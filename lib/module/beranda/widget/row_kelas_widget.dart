import 'package:udp_v2/core.dart';

class RowKelasWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final CircleAvatar circleIcon;
  const RowKelasWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.circleIcon})
      : super(key: key);

  @override
  State<RowKelasWidget> createState() => _RowKelasWidgetState();
}

class _RowKelasWidgetState extends State<RowKelasWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.circleIcon,
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: labelLarge.copyWith(
                color: gray100,
              ),
            ),
            Text(
              widget.subtitle,
              style: bodySmall.copyWith(
                color: gray100,
              ),
            ),
          ],
        )
      ],
    );
  }
}
