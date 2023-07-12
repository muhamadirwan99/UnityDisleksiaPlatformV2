import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';

class LatihanBerhitungController extends GetxController {
  LatihanBerhitungView? view;

  Column content = Column();

  switchContent(kdKelas) {
    switch (kdKelas) {
      case "1":
        content = Column(
          children: [
            LatihanButton(
              color: red600,
              onPressed: () {
                Get.to(const MencariAngkaHilangView());
              },
              icon: "assets/images/icon-angka.svg",
              title: "Matematika",
              subtitle: "Mencari Angka yang Hilang",
            ),
            const SizedBox(
              height: 15,
            ),
            LatihanButton(
              color: const Color(0xffFFAA00),
              onPressed: () {
                Get.to(const MenghitungJumlahBendaView());
              },
              icon: "assets/images/icon-huruf.svg",
              title: "Matematika",
              subtitle: "Menghitung Jumlah Benda/barang",
            ),
            const SizedBox(
              height: 15,
            ),
            LatihanButton(
              color: blue400,
              onPressed: () {
                Get.to(const InstruksiPage());
              },
              icon: "assets/images/icon-instruksi.svg",
              title: "Instruksi",
              subtitle: "Informasi cara bermain",
            ),
          ],
        );
        break;
      case "2":
        content = Column(
          children: [
            LatihanButton(
              color: red600,
              onPressed: () {
                Get.to(const MencariCaraLainView(
                  kdKelas: "2",
                ));
              },
              icon: "assets/images/icon-huruf.svg",
              title: "Matematika",
              subtitle: "Berlatih Menghitung dengan Berbagai Soal",
            ),
            const SizedBox(
              height: 15,
            ),
            LatihanButton(
              color: blue400,
              onPressed: () {
                Get.to(const InstruksiPage());
              },
              icon: "assets/images/icon-instruksi.svg",
              title: "Instruksi",
              subtitle: "Informasi cara bermain",
            ),
          ],
        );
        break;
      default:
        content = Column(
          children: [
            SizedBox(
              width: MediaQuery.of(globalContext).size.width,
              child: Text(
                "Tidak ada latihan berhitung untuk kelas $kdKelas",
                style: titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
    }
  }
}
