import 'package:flutter_svg/flutter_svg.dart';
import 'package:udp_v2/core.dart';

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
        color: gray100,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 9.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Kurikulum Pembelajaran",
                style: titleMedium.copyWith(
                  color: gray900,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          RowKelasWidget(
            circleIcon: CircleAvatar(
                backgroundColor: red100,
                child: SvgPicture.asset("assets/images/books.svg")),
            title: "Kurikulum",
            subtitle: "Kurikulum pemerintah terkini",
            onTap: () {
              Get.to(KurikulumPembelajaranView(
                title: "Kurikulum",
                indexContent: 1,
              ));
            },
          ),
          RowKelasWidget(
            circleIcon: CircleAvatar(
                backgroundColor: red100,
                child: SvgPicture.asset("assets/images/books2.svg")),
            title: "Silabus",
            subtitle: "Silabus pembelajaran dari kurikulum",
            onTap: () {
              Get.to(KurikulumPembelajaranView(
                title: "Silabus",
                indexContent: 2,
              ));
            },
          ),
          RowKelasWidget(
            circleIcon: CircleAvatar(
                backgroundColor: red100,
                child: SvgPicture.asset("assets/images/books3.svg")),
            title: "RPP",
            subtitle: "Rencana pembelajaran guru di kelas",
            onTap: () {
              Get.to(KurikulumPembelajaranView(
                title: "RPP",
                indexContent: 3,
              ));
            },
          ),
        ],
      ),
    );
  }
}
