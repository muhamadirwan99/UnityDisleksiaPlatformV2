import 'package:flutter_svg/flutter_svg.dart';
import 'package:udp_v2/core.dart';

class PanduanParagrafPertamaWidget extends StatelessWidget {
  const PanduanParagrafPertamaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/images_panduan_aplikasi_1.jpg",
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            SvgPicture.asset(
              "assets/images/logo_icon.svg",
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text("Logo untuk mengarahkan Anda pada halaman beranda",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const Icon(
              Icons.search,
              size: 60.0,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                  "Simbol pencarian mengarahkan Anda mengetik apa yang Anda ingin cari pada aplikasi",
                  textAlign: TextAlign.start,
                  style: bodyMedium.copyWith(
                      color: const Color(0xff0A0A0A), height: 1.5)),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const Icon(
              Icons.bookmark_add_outlined,
              size: 60.0,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                  "Simbol pencarian mengarahkan Anda mengetik apa yang Anda ingin cari pada aplikasi",
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
