import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class LatihanBerhitungView extends StatelessWidget {
  final String kdKelas;

  const LatihanBerhitungView({
    Key? key,
    required this.kdKelas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LatihanBerhitungController>(
      init: LatihanBerhitungController(),
      builder: (controller) {
        controller.view = this;

        controller.switchContent(kdKelas);

        return Scaffold(
          appBar: AppBar(
            title: const Text("Latihan Berhitung"),
            leading: InkWell(
              onTap: () {
                Get.to(PilihPelajaranView(
                  kdKelas: kdKelas,
                ));
              },
              child: const Icon(
                Icons.arrow_back,
                size: 24.0,
              ),
            ),
          ),
          backgroundColor: blue500,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hallo, Sahabat 👋", // Headline 2
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0,
                                    color: gray100),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Ayo kita bermain sambil belajar ",
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5,
                                    color: gray100),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SvgPicture.asset(
                          "assets/images/latihanhome.svg",
                          width: 146,
                          height: 134,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: gray100,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 24, right: 24),
                    child: controller.content,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
