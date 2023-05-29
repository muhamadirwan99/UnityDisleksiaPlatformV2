import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/utils/widget/action_button.dart';
import 'package:udp_v2/utils/widget/green_button.dart';

class MataPelajaranView extends StatelessWidget {
  final String kelas;
  final String kdKelas;
  const MataPelajaranView({
    Key? key,
    required this.kelas,
    required this.kdKelas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MataPelajaranController>(
      init: MataPelajaranController(),
      builder: (controller) {
        controller.view = this;
        controller.switchMateri(kdKelas);

        return Scaffold(
          appBar: AppBar(
            title: const Text("Materi Pelajaran"),
            actions: const [ActionButton()],
          ),
          backgroundColor: blue500,
          body: StreamBuilder(
            stream: controller.materi,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
                  snapshot.data!;
              Map<String, dynamic>? data = documentSnapshot.data();

              List<dynamic>? dataList =
                  data != null ? data.values.toList() : null;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                kelas,
                                style:
                                    headlineSmall.copyWith(color: neutralWhite),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Mata Pelajaran",
                                style:
                                    labelMedium.copyWith(color: neutralWhite),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                              "assets/images/ilus_mata_pelajaran.svg"),
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
                              "Pilih Mata Pelajaran",
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                            ListView.builder(
                              itemCount: dataList!.length,
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              itemBuilder: (context, index) {
                                var data = dataList[index];
                                return Column(
                                  children: [
                                    GreenButton(
                                      value: data["mapel"],
                                      onPressed: () {
                                        Get.to(BabPelajaranView(
                                          data: data,
                                          kelas: kelas,
                                        ));
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
              );
            },
          ),
        );
      },
    );
  }
}
