import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/utils/widget/latihan_button.dart';

class LatihanBerhitungView extends StatelessWidget {
  const LatihanBerhitungView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LatihanBerhitungController>(
      init: LatihanBerhitungController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Latihan"),
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
                    child: Column(
                      children: [
                        LatihanButton(
                          color: red600,
                          onPressed: () {},
                          icon: "assets/images/icon-huruf.svg",
                          title: "Bahasa Indonesia",
                          subtitle: "Membedakan Huruf yang Mirip",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        LatihanButton(
                          color: const Color(0xffFFAA00),
                          onPressed: () {},
                          icon: "assets/images/icon-huruf.svg",
                          title: "Bahasa Indonesia",
                          subtitle: "Membaca Suku Kata",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        LatihanButton(
                          color: red600,
                          onPressed: () {},
                          icon: "assets/images/icon-huruf.svg",
                          title: "Bahasa Indonesia",
                          subtitle: "Membaca Kata Benda",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        LatihanButton(
                          color: const Color(0xffFFAA00),
                          onPressed: () {},
                          icon: "assets/images/icon-huruf.svg",
                          title: "Bahasa Indonesia",
                          subtitle: "Membaca Kalimat",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        LatihanButton(
                          color: blue400,
                          onPressed: () {},
                          icon: "assets/images/icon-instruksi.svg",
                          title: "Instruksi",
                          subtitle: "Informasi cara bermain",
                        ),
                      ],
                    ),
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
