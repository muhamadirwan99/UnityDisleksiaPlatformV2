import 'package:flutter_svg/flutter_svg.dart';
import 'package:udp_v2/core.dart';

class ContainerMateriPembelajaranWidget extends StatefulWidget {
  const ContainerMateriPembelajaranWidget({Key? key}) : super(key: key);

  @override
  State<ContainerMateriPembelajaranWidget> createState() =>
      _ContainerMateriPembelajaranWidgetState();
}

class _ContainerMateriPembelajaranWidgetState
    extends State<ContainerMateriPembelajaranWidget> {
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
                "Materi Pelajaran",
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
              child: SvgPicture.asset("assets/images/materi_1.svg"),
            ),
            title: "Kelas 1",
            subtitle: "Materi pelajaran kelas 1 SD",
            onTap: () {
              Get.to(const PilihPelajaranView(
                kdKelas: "1",
              ));
            },
          ),
          RowKelasWidget(
            circleIcon: CircleAvatar(
              backgroundColor: red100,
              child: SvgPicture.asset("assets/images/materi_2.svg"),
            ),
            title: "Kelas 2",
            subtitle: "Materi pelajaran kelas 2 SD",
            onTap: () {
              Get.to(const PilihPelajaranView(
                kdKelas: "2",
              ));
            },
          ),
        ],
      ),
    );
  }
}
