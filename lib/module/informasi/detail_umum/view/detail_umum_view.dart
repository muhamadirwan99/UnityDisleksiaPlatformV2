import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:udp_v2/utils/widget/action_button.dart';
import 'package:udp_v2/core.dart';
import 'package:get/get.dart';

class DetailUmumView extends StatelessWidget {
  final String title;
  final Posts data;

  const DetailUmumView({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailUmumController>(
      init: DetailUmumController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            actions: const [
              ActionButton(),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 16, right: 16, left: 16, bottom: 90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: Center(
                      child: FancyShimmerImage(
                        imageUrl: data.thumbnail.toString(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    data.title.toString(),
                    style: titleLarge.copyWith(color: gray900),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    controller.convertDateString(data.pubDate.toString()),
                    style: titleMedium.copyWith(color: blue800),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    data.description.toString(),
                    style: bodyMedium.copyWith(
                      color: gray800,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
