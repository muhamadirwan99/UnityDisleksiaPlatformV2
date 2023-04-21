import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udp_v2/core.dart';

class IntroductionView extends StatefulWidget {
  const IntroductionView({Key? key}) : super(key: key);

  Widget build(context, IntroductionController controller) {
    controller.view = this;

    return Scaffold(
        backgroundColor: blue600,
        body: SafeArea(
            child: Container(
          width: MediaQuery.of(context).size.width,
          color: gray100,
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Get.offAll(const BerandaView());
                    },
                    child: Text(
                      "Lewati",
                      style: titleMedium.copyWith(color: gray500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: controller.imageAssets.length,
                      itemBuilder: (context, position) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(controller.imageAssets[position]),
                            const SizedBox(
                              height: 35,
                            ),
                            Text(
                              controller.textItems[position],
                              style: titleLarge.copyWith(
                                  color: const Color(0xff1E1E1E), fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.index <= 0.99
                        ? const SizedBox(
                            width: 80,
                          )
                        : InkWell(
                            onTap: () {
                              controller.previousSlide();
                            },
                            child: SizedBox(
                              width: 80,
                              child: Text(
                                "Kembali",
                                style: titleMedium.copyWith(color: blue600),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                    DotsIndicator(
                      dotsCount: controller.imageAssets.length,
                      position: controller.index,
                      decorator: DotsDecorator(
                        size: const Size.square(10),
                        color: gray200,
                        activeColor: blue600,
                        activeSize: const Size(40.0, 10),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: InkWell(
                        onTap: controller.index == 2
                            ? () {
                                Get.offAll(BerandaView());
                              }
                            : () {
                                controller.nextSlide();
                              },
                        child: Text(
                          controller.index == 2 ? "MULAI" : "Lanjut",
                          style: titleMedium.copyWith(color: blue600),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )));
  }

  @override
  State<IntroductionView> createState() => IntroductionController();
}
