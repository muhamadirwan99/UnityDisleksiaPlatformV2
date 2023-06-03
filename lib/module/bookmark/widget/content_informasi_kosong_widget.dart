import 'package:flutter_svg/flutter_svg.dart';
import 'package:udp_v2/core.dart';

class ContentInformasiKosongWidget extends StatefulWidget {
  const ContentInformasiKosongWidget({Key? key}) : super(key: key);

  @override
  State<ContentInformasiKosongWidget> createState() =>
      _ContentInformasiKosongWidgetState();
}

class _ContentInformasiKosongWidgetState
    extends State<ContentInformasiKosongWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/images/ilustrasi_informasi_kosong.svg"),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Belum ada Informasi di Bookmark",
          style: bodyMedium.copyWith(color: gray500),
        ),
        const SizedBox(
          height: 16,
        ),
        // Text(
        //   "Tambahkan Informasi?",
        //   style: titleMedium.copyWith(color: blue600),
        // ),
      ],
    );
  }
}
