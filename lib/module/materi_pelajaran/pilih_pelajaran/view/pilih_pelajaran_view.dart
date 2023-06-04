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
        //     FirebaseFirestore.instance.collection('kurikulum');

        // // Mendapatkan referensi dokumen dengan ID khusus
        // DocumentReference documentRef = usersCollection.doc('silabus');

        // // Data yang akan disisipkan
        // Map<String, dynamic> data = {
        //   'kelas1': {
        //     "title": "Kelas 1",
        //     "subtitle": "Silabus Kurtilas Kelas 1 SD",
        //     "icon":
        //         "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/icon%2Ficon_silabus_kelas1.svg?alt=media&token=5df155ad-3ead-4d37-bc5e-a716bda09d2f",
        //     "mapel": [
        //       {
        //         "title": "Matematika",
        //         "subtitle": "Silabus matematika kelas 1 SD",
        //         "icon":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/icon%2Ficon_silabus_rpp_menu1.svg?alt=media&token=76d47857-c65c-404e-b7d7-d895726b59a6",
        //         "desc":
        //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.",
        //         "linkPdf":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/modul%2Fmodul.pdf?alt=media&token=9a2f6901-2c11-419d-bde9-a7f7b95b94e5",
        //       },
        //       {
        //         "title": "Bahasa Indonesia",
        //         "subtitle": "Silabus bahasa indonesia kelas 1 SD",
        //         "icon":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/icon%2Ficon_silabus_rpp_menu2.svg?alt=media&token=0b5c7012-11ee-4a37-b758-e7ed94db459a",
        //         "desc":
        //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.",
        //         "linkPdf":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/modul%2Fmodul.pdf?alt=media&token=9a2f6901-2c11-419d-bde9-a7f7b95b94e5",
        //       },
        //       {
        //         "title": "Agama",
        //         "subtitle": "Silabus agama kelas 1 SD",
        //         "icon":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/icon%2Ficon_silabus_rpp_menu3.svg?alt=media&token=1ede090d-aa8c-46f3-9458-9cf181866b51",
        //         "desc":
        //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.",
        //         "linkPdf":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/modul%2Fmodul.pdf?alt=media&token=9a2f6901-2c11-419d-bde9-a7f7b95b94e5",
        //       },
        //     ],
        //   },
        //   'kelas2': {
        //     "title": "Kelas 2",
        //     "subtitle": "Silabus Kurtilas Kelas 2 SD",
        //     "icon":
        //         "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/icon%2Ficon_silabus_kelas2.svg?alt=media&token=f34f719a-f4b9-45b0-9743-bc49c1ec7676",
        //     "mapel": [
        //       {
        //         "title": "Matematika",
        //         "subtitle": "Silabus matematika kelas 2 SD",
        //         "icon":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/icon%2Ficon_silabus_rpp_menu1.svg?alt=media&token=76d47857-c65c-404e-b7d7-d895726b59a6",
        //         "desc":
        //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.",
        //         "linkPdf":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/modul%2Fmodul.pdf?alt=media&token=9a2f6901-2c11-419d-bde9-a7f7b95b94e5",
        //       },
        //       {
        //         "title": "Bahasa Indonesia",
        //         "subtitle": "Silabus bahasa indonesia kelas 2 SD",
        //         "icon":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/icon%2Ficon_silabus_rpp_menu2.svg?alt=media&token=0b5c7012-11ee-4a37-b758-e7ed94db459a",
        //         "desc":
        //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.",
        //         "linkPdf":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/modul%2Fmodul.pdf?alt=media&token=9a2f6901-2c11-419d-bde9-a7f7b95b94e5",
        //       },
        //       {
        //         "title": "Agama",
        //         "subtitle": "Silabus agama kelas 2 SD",
        //         "icon":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/icon%2Ficon_silabus_rpp_menu3.svg?alt=media&token=1ede090d-aa8c-46f3-9458-9cf181866b51",
        //         "desc":
        //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.",
        //         "linkPdf":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/modul%2Fmodul.pdf?alt=media&token=9a2f6901-2c11-419d-bde9-a7f7b95b94e5",
        //       },
        //     ]
        //   },
        //   'kelas3': {
        //     "title": "Kelas 3",
        //     "subtitle": "Silabus Kurtilas Kelas 3 SD",
        //     "icon":
        //         "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/icon%2Ficon_silabus_kelas3.svg?alt=media&token=7381ddcd-a898-4522-999a-0c086cbee854",
        //     "mapel": [
        //       {
        //         "title": "Matematika",
        //         "subtitle": "Silabus matematika kelas 3 SD",
        //         "icon":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/icon%2Ficon_silabus_rpp_menu1.svg?alt=media&token=76d47857-c65c-404e-b7d7-d895726b59a6",
        //         "desc":
        //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.",
        //         "linkPdf":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/modul%2Fmodul.pdf?alt=media&token=9a2f6901-2c11-419d-bde9-a7f7b95b94e5",
        //       },
        //       {
        //         "title": "Bahasa Indonesia",
        //         "subtitle": "Silabus bahasa indonesia kelas 3 SD",
        //         "icon":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/icon%2Ficon_silabus_rpp_menu2.svg?alt=media&token=0b5c7012-11ee-4a37-b758-e7ed94db459a",
        //         "desc":
        //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.",
        //         "linkPdf":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/modul%2Fmodul.pdf?alt=media&token=9a2f6901-2c11-419d-bde9-a7f7b95b94e5",
        //       },
        //       {
        //         "title": "Agama",
        //         "subtitle": "Silabus agama kelas 3 SD",
        //         "icon":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/icon%2Ficon_silabus_rpp_menu3.svg?alt=media&token=1ede090d-aa8c-46f3-9458-9cf181866b51",
        //         "desc":
        //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.",
        //         "linkPdf":
        //             "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/modul%2Fmodul.pdf?alt=media&token=9a2f6901-2c11-419d-bde9-a7f7b95b94e5",
        //       },
        //     ]
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
