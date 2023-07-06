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
        // DocumentReference documentRef = usersCollection.doc('soalcerita');

        // // Data yang akan disisipkan
        // Map<String, dynamic> data = {
        //   "data": [
        //     {
        //       "question": "“Kutu buku” artinya adalah...",
        //       "image":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fkutu_buku.png?alt=media&token=74aaea66-5413-4455-96b5-0c5e98455c45",
        //       "arrayAnswer": [
        //         'A. Suka Membaca',
        //         'B. Suka Memasak',
        //         'C. Suka Menjual'
        //       ],
        //       "answer": "A. Suka Membaca"
        //     },
        //     {
        //       "question":
        //           "Bina mendapatkan juara 1 di kelasnya, sehingga teman-temanya menjulukinya sebagai...",
        //       "image":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fjuara.png?alt=media&token=5b1b4941-dbfc-45f0-adf2-3fd5039d10ec",
        //       "arrayAnswer": [
        //         'A. Bintang gemilang',
        //         'B. Bintang kelas',
        //         'C. Bintang tamu'
        //       ],
        //       "answer": "B. Bintang kelas"
        //     },
        //     {
        //       "question":
        //           "Dari percakapan diatas, apakah Udin menerima ajakan dari Made?",
        //       "image":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fpercakapan.png?alt=media&token=14fdec29-54e1-47f4-a1ec-984cf15434ed",
        //       "arrayAnswer": ['A. Ya', 'B. Tidak'],
        //       "answer": "B. Tidak"
        //     },
        //     {
        //       "question":
        //           "Kalimat ajakan yang sesuai untuk mengisi titik-titik diatas adalah…",
        //       "image":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fbola.png?alt=media&token=310f185c-237c-4837-812b-dc2b47bc7f7e",
        //       "arrayAnswer": ['A. Ayo', 'B. Cepat', 'C. Sana'],
        //       "answer": "A. Ayo"
        //     },
        //     {
        //       "question":
        //           "Pada percapakan diatas, ibu guru meminta tolong kepada beni untuk membawa kertas. Hal ini merupakan sebuah kalimat…",
        //       "image":
        //           "https://firebasestorage.googleapis.com/v0/b/udp-new.appspot.com/o/images%2Flatihan%2Fpercapan2.png?alt=media&token=faa56441-efcb-4d2d-8408-8d84bd20e0ca",
        //       "arrayAnswer": ['A. Perintah', 'B. Ajakan', 'C. Ucapan'],
        //       "answer": "A. Perintah"
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
