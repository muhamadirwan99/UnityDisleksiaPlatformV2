import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/utils/widget/action_button.dart';
import 'package:udp_v2/utils/widget/green_button.dart';

class BabPelajaranView extends StatelessWidget {
  final dynamic data;
  final String kelas;
  const BabPelajaranView({
    Key? key,
    required this.data,
    required this.kelas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BabPelajaranController>(
      init: BabPelajaranController(),
      builder: (controller) {
        controller.view = this;
        List<dynamic>? dataList = data != null ? data.values.toList() : null;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Materi Pelajaran"),
            actions: const [ActionButton()],
          ),
          backgroundColor: blue500,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            kelas,
                            style: headlineSmall.copyWith(color: neutralWhite),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Bab Pelajaran",
                            style: labelMedium.copyWith(color: neutralWhite),
                          ),
                        ],
                      ),
                      SvgPicture.asset("assets/images/ilus_bab_pelajaran.svg"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: gray100,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 30, right: 30),
                    child: Column(
                      children: [
                        Text(
                          "Pilih Bab",
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        ListView.builder(
                          itemCount: dataList!.length - 1,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          itemBuilder: (context, index) {
                            var data = dataList[index];

                            return Column(
                              children: [
                                GreenButton(
                                  value: data["namaBab"],
                                  onPressed: () {
                                    Get.to(DetailVideoPage(data: data));
                                  },
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
