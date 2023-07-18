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
        // DocumentReference documentRef = usersCollection.doc('menulisbenda');

        // // Data yang akan disisipkan
        // Map<String, dynamic> data = {
        //   "data": [
        //     {
        //       "hint": "“Iffah Fadhilah”",
        //       "imageLink":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fiffah.png?alt=media&token=a5f3eca0-77e6-43ea-8b8b-833241c910f2",
        //       "realAnswer": "iffah fadhilah”",
        //     },
        //     {
        //       "hint": "“Nur Melini Ani”",
        //       "imageLink":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fmeli.png?alt=media&token=423e4c04-66a4-4fc1-8610-beb30ae5d942",
        //       "realAnswer": "nur melini ani”",
        //     },
        //     {
        //       "hint": "“Arsenius Purbandono”",
        //       "imageLink":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Farsen.png?alt=media&token=24f8d266-ec36-4c65-8fbd-ccf55bb35d87",
        //       "realAnswer": "arsenius purbandono",
        //     },
        //     {
        //       "hint": "“Kucing”",
        //       "imageLink":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fkucing.png?alt=media&token=018bfe34-c7a9-48b8-b751-2ab2b1295e99",
        //       "realAnswer": "kucing",
        //     },
        //     {
        //       "hint": "“Jerapah”",
        //       "imageLink":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fjerapah.png?alt=media&token=1f060947-c478-46ca-b586-d3fc43ab64c1",
        //       "realAnswer": "jerapah",
        //     },
        //     {
        //       "hint": "“Ular”",
        //       "imageLink":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fular.png?alt=media&token=9cd6e125-62df-443e-8f0e-576a503fe09d",
        //       "realAnswer": "ular",
        //     },
        //     {
        //       "hint": "“Kuda”",
        //       "imageLink":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fkuda.png?alt=media&token=620e0227-18b1-4693-9a4a-83a1556b754a",
        //       "realAnswer": "kuda",
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
                            Get.to(LatihanPage(
                              kdKelas: kdKelas,
                            ));
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
