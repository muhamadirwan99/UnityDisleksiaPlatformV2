import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

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
        // DocumentReference documentRef = usersCollection.doc('membacakatabenda');

        // // Data yang akan disisipkan
        // Map<String, dynamic> data = {
        //   "data": [
        //     {
        //       "arrayAnswer": ['K', 'A', 'K', 'I'],
        //       "arrayAnswerChoice": ['A', 'B', 'K', 'I'],
        //       "question": ['K', '_', 'K', '_'],
        //       "images":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fkaki.png?alt=media&token=8a00fd6d-795d-4be0-8a0a-b114497ef77b",
        //     },
        //     {
        //       "arrayAnswer": ['H', 'I', 'D', 'U', 'N', 'G'],
        //       "arrayAnswerChoice": ['A', 'U', 'N', 'I'],
        //       "question": ['H', '_', 'D', '_', '_', 'G'],
        //       "images":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fhidung.png?alt=media&token=546f5ef6-f43d-4ac8-a49e-0fdbe5124be3",
        //     },
        //     {
        //       "arrayAnswer": ['T', 'E', 'L', 'I', 'N', 'G', 'A'],
        //       "arrayAnswerChoice": ['E', 'U', 'N', 'I'],
        //       "question": ['T', '_', '_', 'I', '_', 'G', 'A'],
        //       "images":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Ftelinga.png?alt=media&token=dfe879ff-dbcd-439e-84a9-c3003e0e7740",
        //     },
        //     {
        //       "arrayAnswer": ['L', 'U', 'T', 'U', 'T'],
        //       "arrayAnswerChoice": ['I', 'U', 'N', 'T'],
        //       "question": ['_', 'U', 'T', '_', '_'],
        //       "images":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Flutut.png?alt=media&token=21a4ce37-bdfb-4fc8-bfec-d26f373a23f7",
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
