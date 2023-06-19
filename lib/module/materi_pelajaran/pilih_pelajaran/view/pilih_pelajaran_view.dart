import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/utils/widget/green_button.dart';

class PilihPelajaranView extends StatelessWidget {
  final String kdKelas;
  const PilihPelajaranView({
    Key? key,
    required this.kdKelas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PilihPelajaranController>(
      init: PilihPelajaranController(),
      builder: (controller) {
        controller.view = this;

        controller.switchKelas(kdKelas);

        // CollectionReference usersCollection =
        //     FirebaseFirestore.instance.collection('latihan');

        // // Mendapatkan referensi dokumen dengan ID khusus
        // DocumentReference documentRef = usersCollection.doc('vokalkonsonan');

        // // Data yang akan disisipkan
        // Map<String, dynamic> data = {
        //   "data": [
        //     {
        //       "title": "keluarga",
        //       "gambar":
        //           "https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
        //     },
        //     {
        //       "title": "ayah",
        //       "linkSound":
        //           "https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
        //     },
        //     {
        //       "title": "ibu",
        //       "linkSound":
        //           "https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
        //     },
        //   ]
        // };

        // // Menyisipkan data ke Firestore
        // documentRef
        //     .set(data)
        //     .then((value) => print('Data berhasil disisipkan'))
        //     .catchError((error) => print('Gagal menyisipkan data: $error'));

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.to(const MenuNavView());
              },
            ),
            title: const Text("Materi Pelajaran"),
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
                      Text(
                        controller.kelas, // Headline 2
                        style: headlineSmall.copyWith(color: neutralWhite),
                      ),
                      SvgPicture.asset(
                          "assets/images/ilus_pilih_pelajaran.svg"),
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
                          "Pilih Pembelajaran",
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        GreenButton(
                          value: "Video dan Materi Pelajaran",
                          onPressed: () {
                            Get.to(
                              MataPelajaranView(
                                kelas: controller.kelas,
                                kdKelas: kdKelas,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        GreenButton(
                          value: "Latihan Menulis",
                          onPressed: () {
                            Get.to(const LatihanPage());
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        GreenButton(
                          value: "Latihan Berhitung",
                          onPressed: () {
                            Get.to(LatihanBerhitungView(kdKelas: kdKelas));
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        GreenButton(
                          value: "Latihan Membaca",
                          onPressed: () {
                            Get.to(LatihanMembacaView(kdKelas: kdKelas));
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
