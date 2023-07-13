import 'package:udp_v2/core.dart';

class PanduanParagrafWidget extends StatelessWidget {
  const PanduanParagrafWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/images_panduan_aplikasi_1.png",
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          "assets/images/images_panduan_aplikasi_2.png",
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(
          height: 8,
        ),
        Flex(direction: Axis.horizontal, children: [
          Expanded(
            child: Text(
                "Kategori Kurikulum Pembelajaran dikkhususkan untuk guru dan orangtua. ",
                textAlign: TextAlign.start,
                style: bodyMedium.copyWith(
                    color: const Color(0xff0A0A0A), height: 1.5)),
          ),
        ]),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 15,
              child: Text("1.",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
            Expanded(
              child: Text(
                  "Kurikulum untuk mengetahui informasi terkini terbitan dari pemerintahan",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 15,
              child: Text("2.",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
            Expanded(
              child: Text(
                  "Modul Pembelajaan untuk Mengetahui Kesulurahan Perangkat Pembelajaran",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Image.asset(
          "assets/images/images_panduan_aplikasi_3.png",
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(
          height: 8,
        ),
        Flex(direction: Axis.horizontal, children: [
          Expanded(
            child: Text(
                "Kategori Materi Pembelajaran dikkhususkan untuk siswa. Ada pun alur penggunaanya sebagai berikut:",
                textAlign: TextAlign.start,
                style: bodyMedium.copyWith(
                    color: const Color(0xff0A0A0A), height: 1.5)),
          ),
        ]),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 15,
              child: Text("1.",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
            Expanded(
              child: Text("Memilik informasi yang akan diakses",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 15,
              child: Text("2.",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
            Expanded(
              child: Text(
                  "Anda akan mendapati 5 pilihan menu, yaitu materi pelajaran, video pelajaran, praktek berhitung, praktek menulis, dan praktek membaca. Silakan pilih menu yang Anda inginkan.",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 15,
              child: Text("3.",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
            Expanded(
              child: Text(
                  "Anda sudah bisa mendapatkan pembelajaran dari mata pelajaran dan praktek yang Anda inginkan.",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Image.asset(
          "assets/images/images_panduan_aplikasi_4.png",
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(
          height: 8,
        ),
        Flex(direction: Axis.horizontal, children: [
          Expanded(
            child: Text(
                "Kategori Informasi Menarik dikkhususkan untuk guru dan orangtua. Ada pun alur penggunaanya sebagai berikut:",
                textAlign: TextAlign.start,
                style: bodyMedium.copyWith(
                    color: const Color(0xff0A0A0A), height: 1.5)),
          ),
        ]),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 15,
              child: Text("1.",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
            Expanded(
              child: Text("Memilih informasi yang akan diakses.",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 15,
              child: Text("2.",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
            Expanded(
              child: Text("Anda bisa membaca informasi tersebut.",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 15,
              child: Text("3.",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
            Expanded(
              child: Text(
                  "Anda bisa menambahkan informasi ke dalam daftar favorit Anda dengan mengklik bookmark.",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
          ],
        ),
      ],
    );
  }
}
