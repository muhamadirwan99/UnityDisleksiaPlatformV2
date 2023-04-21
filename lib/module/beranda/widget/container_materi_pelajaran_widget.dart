import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/beranda/widget/row_kelas_widget.dart';

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
        color: blue600,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Materi Pelajaran",
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
                child: Text(
                  "1",
                  style: headlineSmall.copyWith(
                      color: red500, fontWeight: FontWeight.w500),
                ),
              ),
              title: "Kelas 1",
              subtitle: "Materi pelajaran kelas 1 SD",
            ),
            const SizedBox(
              height: 12,
            ),
            RowKelasWidget(
              circleIcon: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "2",
                  style: headlineSmall.copyWith(
                      color: red500, fontWeight: FontWeight.w500),
                ),
              ),
              title: "Kelas 2",
              subtitle: "Materi pelajaran kelas 2 SD",
            ),
            const SizedBox(
              height: 12,
            ),
            RowKelasWidget(
              circleIcon: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "3",
                  style: headlineSmall.copyWith(
                      color: red500, fontWeight: FontWeight.w500),
                ),
              ),
              title: "Kelas 3",
              subtitle: "Materi pelajaran kelas 3 SD",
            )
          ],
        ),
      ),
    );
  }
}
