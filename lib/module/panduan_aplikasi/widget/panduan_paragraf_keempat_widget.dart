import 'package:udp_v2/core.dart';

class PanduanParagrafKeempatWidget extends StatelessWidget {
  const PanduanParagrafKeempatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/images_panduan_aplikasi_4.jpg",
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
