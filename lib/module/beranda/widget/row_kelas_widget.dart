import 'package:udp_v2/core.dart';

class RowKelasWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final CircleAvatar circleIcon;
  final Function() onTap;
  const RowKelasWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.circleIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  State<RowKelasWidget> createState() => _RowKelasWidgetState();
}

class _RowKelasWidgetState extends State<RowKelasWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5, color: blue400),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 9,
            horizontal: 14,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  widget.circleIcon,
                  const SizedBox(
                    width: 12.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: labelLarge.copyWith(
                          color: gray900,
                        ),
                      ),
                      const SizedBox(
                        height: 1.0,
                      ),
                      Text(
                        widget.subtitle,
                        style: bodySmall.copyWith(
                          color: gray900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.chevron_right,
                color: gray900,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
