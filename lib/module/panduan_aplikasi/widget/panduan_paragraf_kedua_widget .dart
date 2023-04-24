import 'package:flutter_svg/flutter_svg.dart';
import 'package:udp_v2/core.dart';

class PanduanParagrafKeduaWidget extends StatelessWidget {
  const PanduanParagrafKeduaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/images_panduan_aplikasi_2.jpg",
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
                  "Silabus pembelajaran untuk mengetahui hal apa saya yang akan dipelajari oleh siswa selama 2 semester",
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
                  "RPP adalah kegiatan yang dilakukan guru dan siswa selama pembelaran di sekolah berlangsung",
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
