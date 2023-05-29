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
        //     FirebaseFirestore.instance.collection('materi');

        // // Mendapatkan referensi dokumen dengan ID khusus
        // DocumentReference documentRef = usersCollection.doc('kelas2');

        // // Data yang akan disisipkan
        // Map<String, dynamic> data = {
        //   'inggris': {
        //     "mapel": "Inggris",
        //     'bab1': {
        //       'namaBab': "BAB 1",
        //       'namaMapel': "Test",
        //       'descMapel': "Test",
        //       'linkModul':
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/modul%2Fmodul.pdf?alt=media&token=9a2f6901-2c11-419d-bde9-a7f7b95b94e5",
        //       'linkVideo':
        //           "https://www.youtube.com/watch?v=whBzFeh26ho&pp=ygUnYmVsYWphciBtZW51bGlzIGFuZ2thIGRhbiBiaWxhbmdhbiBhbmFr",
        //     },
        //     'bab2': {
        //       'namaBab': "BAB 2",
        //       'namaMapel': "Test",
        //       'descMapel': "Test",
        //       'linkModul':
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/modul%2Fmodul.pdf?alt=media&token=9a2f6901-2c11-419d-bde9-a7f7b95b94e5",
        //       'linkVideo':
        //           "https://www.youtube.com/watch?v=whBzFeh26ho&pp=ygUnYmVsYWphciBtZW51bGlzIGFuZ2thIGRhbiBiaWxhbmdhbiBhbmFr",
        //     },
        //   },
        //   'jepang': {
        //     "mapel": "jepang",
        //     'bab1': {
        //       'namaBab': "BAB 1",
        //       'namaMapel': "Test",
        //       'descMapel': "Test",
        //       'linkModul':
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/modul%2Fmodul.pdf?alt=media&token=9a2f6901-2c11-419d-bde9-a7f7b95b94e5",
        //       'linkVideo':
        //           "https://www.youtube.com/watch?v=whBzFeh26ho&pp=ygUnYmVsYWphciBtZW51bGlzIGFuZ2thIGRhbiBiaWxhbmdhbiBhbmFr",
        //     },
        //     'bab2': {
        //       'namaBab': "BAB 2",
        //       'namaMapel': "Test",
        //       'descMapel': "Test",
        //       'linkModul':
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/modul%2Fmodul.pdf?alt=media&token=9a2f6901-2c11-419d-bde9-a7f7b95b94e5",
        //       'linkVideo':
        //           "https://www.youtube.com/watch?v=whBzFeh26ho&pp=ygUnYmVsYWphciBtZW51bGlzIGFuZ2thIGRhbiBiaWxhbmdhbiBhbmFr",
        //     },
        //   },
        // };

        // // Menyisipkan data ke Firestore
        // documentRef
        //     .set(data)
        //     .then((value) => print('Data berhasil disisipkan'))
        //     .catchError((error) => print('Gagal menyisipkan data: $error'));

        return Scaffold(
          appBar: AppBar(
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
                          value: "Materi Berhitung",
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        GreenButton(
                          value: "Materi Membaca",
                          onPressed: () {},
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
