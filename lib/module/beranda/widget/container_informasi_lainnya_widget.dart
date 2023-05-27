import 'package:flutter_svg/flutter_svg.dart';
import 'package:udp_v2/core.dart';

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
                "Informasi Lainnya",
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
                child: SvgPicture.asset("assets/images/umum.svg")),
            title: "Informasi Umum",
            subtitle: "Informasi Umum Pendidikan di Indonesia",
            onTap: () {},
          ),
          RowKelasWidget(
            circleIcon: CircleAvatar(
                backgroundColor: red100,
                child: SvgPicture.asset("assets/images/computer.svg")),
            title: "Informasi Webinar",
            subtitle: "Webinar/seminar terkait disleksia",
            onTap: () {},
          ),
          RowKelasWidget(
            circleIcon: CircleAvatar(
                backgroundColor: red100,
                child:
                    SvgPicture.asset("assets/images/icon_membimbing_anak.svg")),
            title: "Kiat Membimbing Anak",
            subtitle: "Edukasi perlakuan terhadap anak",
            onTap: () {},
          ),
          RowKelasWidget(
            circleIcon: CircleAvatar(
                backgroundColor: red100,
                child: SvgPicture.asset("assets/images/peoples_with_pen.svg")),
            title: "Informasi Kursus Disleksia",
            subtitle: "Kursus berbagai hal diskleksia",
            onTap: () {},
          ),
          RowKelasWidget(
            circleIcon: CircleAvatar(
                backgroundColor: red100,
                child: SvgPicture.asset("assets/images/doctor.svg")),
            title: "Informasi Terapi Disleksia",
            subtitle: "Terapi berbagai treatment diskleksia",
            onTap: () {},
          )
        ],
      ),
    );
  }
}
