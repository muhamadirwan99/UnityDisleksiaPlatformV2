import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:udp_v2/core.dart';

class CardInformasiWidget extends StatefulWidget {
  final Informasi data;
  const CardInformasiWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<CardInformasiWidget> createState() => _CardInformasiWidgetState();
}

class _CardInformasiWidgetState extends State<CardInformasiWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: gray100,
      elevation: 0,
      child: Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: gray200, width: 1))),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 108,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 85,
                    width: 220,
                    child: Text(
                      widget.data.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      style: titleMedium.copyWith(color: gray800),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 220,
                    child: Text(widget.data.date,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        style: bodySmall.copyWith(color: gray700)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: SizedBox(
                  height: 108,
                  width: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FancyShimmerImage(
                      imageUrl: widget.data.image,
                      boxFit: BoxFit.cover,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
