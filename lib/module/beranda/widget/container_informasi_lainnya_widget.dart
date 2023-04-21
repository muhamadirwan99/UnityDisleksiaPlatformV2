import 'package:flutter_svg/flutter_svg.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/beranda/widget/row_kelas_widget.dart';

class ContainerInformasiLainnyaWidget extends StatefulWidget {
  const ContainerInformasiLainnyaWidget({Key? key}) : super(key: key);

  @override
  State<ContainerInformasiLainnyaWidget> createState() =>
      _ContainerInformasiLainnyaWidgetState();
}

class _ContainerInformasiLainnyaWidgetState
    extends State<ContainerInformasiLainnyaWidget> {
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
                "Informasi Lainnya",
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
                  child: SvgPicture.asset("assets/images/computer.svg")),
              title: "Informasi Webinar",
              subtitle: "Webinar/seminar terkait disleksia",
            ),
            const SizedBox(
              height: 12,
            ),
            RowKelasWidget(
              circleIcon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                      "assets/images/icon_membimbing_anak.svg")),
              title: "Kiat Membimbing Anak",
              subtitle: "Edukasi perlakuan terhadap anak",
            ),
            const SizedBox(
              height: 12,
            ),
            RowKelasWidget(
              circleIcon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child:
                      SvgPicture.asset("assets/images/peoples_with_pen.svg")),
              title: "Informasi Kursus Disleksia",
              subtitle: "Kursus berbagai hal diskleksia",
            ),
            const SizedBox(
              height: 12,
            ),
            RowKelasWidget(
              circleIcon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset("assets/images/doctor.svg")),
              title: "Informasi Terapi Disleksia",
              subtitle: "Terapi berbagai treatment diskleksia",
            )
          ],
        ),
      ),
    );
  }
}
