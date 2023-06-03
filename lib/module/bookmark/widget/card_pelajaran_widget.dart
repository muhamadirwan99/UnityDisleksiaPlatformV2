import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:udp_v2/core.dart';

class CardPelajaranWidget extends StatefulWidget {
  final Video video;
  final BookmarkController controller;
  const CardPelajaranWidget({
    Key? key,
    required this.video,
    required this.controller,
  }) : super(key: key);

  @override
  State<CardPelajaranWidget> createState() => _CardPelajaranWidgetState();
}

class _CardPelajaranWidgetState extends State<CardPelajaranWidget> {
  @override
  Widget build(BuildContext context) {
    widget.controller.getThumbnail(widget.video.linkVideo);
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: gray300, //<-- SEE HERE
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 108,
                width: 190,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FancyShimmerImage(
                    imageUrl: widget.controller.image,
                    boxFit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: SizedBox(
                height: 108,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 108 / 2,
                      width: 130,
                      child: Text(
                        widget.video.namaMapel,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: titleMedium.copyWith(
                            color: const Color(0xff231F20)),
                      ),
                    ),
                    SizedBox(
                      height: 108 / 2,
                      width: 130,
                      child: Text(widget.video.descMapel,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: bodySmall.copyWith(color: gray700)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
