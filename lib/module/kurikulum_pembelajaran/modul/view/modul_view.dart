// ignore_for_file: prefer_null_aware_operators

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';

class ModulView extends StatelessWidget {
  const ModulView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModulController>(
      init: ModulController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Modul Pembelajaran"),
          ),
          body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("kurikulum")
                  .doc("modul")
                  .snapshots(),
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
                  child: Container(
                    padding: const EdgeInsets.all(26.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Modul Pembelajaran",
                            style: headlineSmall.copyWith(
                              color: neutralBlack,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Dalam Kurikulum Merdeka, modul ajar adalah salah satu metode pengajaran yang umum digunakan. Modul ajar adalah materi pembelajaran yang dirancang sedemikian rupa agar siswa dapat belajar secara mandiri dengan panduan yang jelas. Modul ajar dapat mencakup berbagai topik atau mata pelajaran, dan dapat disesuaikan dengan minat dan tingkat kemampuan siswa. Ciri dan karakteristik modul ajar dalam Kurikulum Merdeka: Fleksibilitas: Modul ajar dirancang agar dapat disesuaikan dengan kebutuhan dan minat siswa. Siswa dapat memilih modul yang sesuai dengan minat mereka, sehingga memotivasi mereka untuk belajar dengan lebih antusias. Keterlibatan aktif: Modul ajar mendorong keterlibatan aktif siswa dalam proses pembelajaran. Siswa akan melakukan eksplorasi mandiri, mencari informasi, dan melibatkan diri dalam kegiatan praktis yang relevan dengan topik yang dipelajari. mengatur waktu serta upaya mereka sendiri.",
                          textAlign: TextAlign.justify,
                          style: bodyMedium.copyWith(
                              color: neutralBlack, height: 1.5),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        ListView.builder(
                          itemCount: dataList![0].length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(DetailPdfModulView(
                                      linkPdf: dataList[0][index]["linkPdf"],
                                    ));
                                  },
                                  child: Container(
                                    height: 58,
                                    decoration: const BoxDecoration(
                                      color: blue500,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          5.0,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 16),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/icon_silabus.svg"),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                dataList[0][index]["title"],
                                                style: labelLarge.copyWith(
                                                    color: neutralWhite),
                                              ),
                                              const SizedBox(
                                                height: 1.0,
                                              ),
                                              Text(
                                                dataList[0][index]["subtitle"],
                                                style: bodySmall.copyWith(
                                                    color: neutralWhite),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
