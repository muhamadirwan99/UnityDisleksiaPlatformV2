import 'package:udp_v2/core.dart';
import 'package:get/get.dart';

class KurikulumView extends StatelessWidget {
  const KurikulumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KurikulumController>(
      init: KurikulumController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: neutralWhite,
          appBar: AppBar(
            title: const Text("Kurikulum"),
            backgroundColor: blue600,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Kurikulum Pembelajaran",
                      style: headlineSmall.copyWith(
                          color: neutralBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "assets/images/image_kurikulum.png",
                    height: 200.0,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 280,
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.",
                      style:
                          bodyMedium.copyWith(color: neutralBlack, height: 1.5),
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
