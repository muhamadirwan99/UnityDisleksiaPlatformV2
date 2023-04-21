import 'package:flutter_svg/flutter_svg.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/beranda/widget/row_kelas_widget.dart';

class ContainerKurikulumWidget extends StatefulWidget {
  const ContainerKurikulumWidget({Key? key}) : super(key: key);

  @override
  State<ContainerKurikulumWidget> createState() =>
      _ContainerKurikulumWidgetState();
}

class _ContainerKurikulumWidgetState extends State<ContainerKurikulumWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: blue600,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Kurikulum Pembelajaran",
                style: titleSmall.copyWith(
                  color: gray100,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            RowKelasWidget(
              circleIcon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset("assets/images/books.svg")),
              title: "Kurikulum",
              subtitle: "Kurikulum pemerintah terkini",
            ),
            const SizedBox(
              height: 12,
            ),
            RowKelasWidget(
              circleIcon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset("assets/images/books2.svg")),
              title: "Silabus",
              subtitle: "Silabus pembelajaran dari kurikulum",
            ),
            const SizedBox(
              height: 12,
            ),
            RowKelasWidget(
              circleIcon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset("assets/images/books3.svg")),
              title: "RPP",
              subtitle: "Rencana pembelajaran guru di kelas",
            ),
          ],
        ),
      ),
    );
  }
}
