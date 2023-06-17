// ignore_for_file: camel_case_types
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:udp_v2/core.dart';

class CardInformasi extends StatefulWidget {
  final String title;
  final String date;
  final String image;
  final Function() onTap;

  const CardInformasi({
    Key? key,
    required this.title,
    required this.date,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CardInformasi> createState() => _CardInformasiState();
}

class _CardInformasiState extends State<CardInformasi> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: blue500,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 10),
          child: Row(
            children: [
              FancyShimmerImage(
                imageUrl: widget.image,
                height: 76,
                width: 66,
              ),
              const SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: titleMedium.copyWith(color: neutralWhite),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      widget.date,
                      style: bodySmall.copyWith(color: neutralWhite),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
