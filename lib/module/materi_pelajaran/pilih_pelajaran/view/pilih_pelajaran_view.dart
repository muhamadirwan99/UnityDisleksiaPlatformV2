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
        // DocumentReference documentRef = usersCollection.doc('menuliskalimat');

        // // Data yang akan disisipkan
        // Map<String, dynamic> data = {
        //   "data": [
        //     {
        //       "question":
        //           "Tulislah kata dari “buah tangan” pada kolom dibawah …",
        //       "imageLink":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fbuah_tangan.png?alt=media&token=83db5646-fb6f-43fc-b947-71de57e9a2f6",
        //       "narasi":
        //           "Sandi bulan lalu pergi ke jogja, sehingga membawakan bakpia sebagai “buah tangan” yaitu oleh-oleh.",
        //       "realAnswer": "buah tangan",
        //     },
        //     {
        //       "question": "Tuliskan kalimat diatas pada kolom di bawah…",
        //       "imageLink":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Frudi.png?alt=media&token=91f4ef96-b8ae-46b8-935f-3eaa70a78e64",
        //       "narasi":
        //           "“Semalam Rudi mendapatkan bunga tidur bertemu dengan artis idolanya”",
        //       "realAnswer":
        //           "Semalam Rudi mendapatkan bunga tidur bertemu dengan artis idolanya",
        //     },
        //     {
        //       "question": "Tuliskan kalimat diatas pada kolom di bawah…",
        //       "imageLink":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fmembaca.png?alt=media&token=bd7b5a39-24e5-445b-ac46-5fb4d7b061a9",
        //       "narasi": "“Ayo membaca buku karena dapat menambah ilmu”",
        //       "realAnswer": "Ayo membaca buku karena dapat menambah ilmu",
        //     },
        //     {
        //       "question": "Tuliskan kalimat diatas pada kolom di bawah…",
        //       "imageLink":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fadik.png?alt=media&token=01c27d4f-ec6c-4aa1-a857-bd154de173c5",
        //       "narasi": "“Adik, tolong antarkan kue ini kepada ibu”",
        //       "realAnswer": "Adik, tolong antarkan kue ini kepada ibu",
        //     },
        //     {
        //       "question":
        //           "Kalimat yang sesuai untuk mengisi kolom diatas adalah…",
        //       "imageLink":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fedo.png?alt=media&token=e1df0513-3b30-4a75-9824-05d8a49fe696",
        //       "narasi": "Udin ingin meminta “tolong” kepada Edo.",
        //       "realAnswer": "tolong",
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
