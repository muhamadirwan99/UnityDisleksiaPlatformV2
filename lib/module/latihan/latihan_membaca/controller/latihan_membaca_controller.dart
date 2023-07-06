import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';

class LatihanMembacaController extends GetxController {
  LatihanMembacaView? view;

  Column content = Column();

  switchContent(kdKelas) {
    switch (kdKelas) {
      case "1":
        content = Column(
          children: [
            LatihanButton(
              color: red600,
              onPressed: () {
                Get.to(MembedakanHurufView(
                  kdKelas: kdKelas,
                ));
              },
              icon: "assets/images/icon-huruf.svg",
              title: "Bahasa Indonesia",
              subtitle: "Membedakan Huruf yang Mirip",
            ),
            const SizedBox(
              height: 15,
            ),
            LatihanButton(
              color: const Color(0xffFFAA00),
              onPressed: () {
                Get.to(const MembacaSukuKataView());
              },
              icon: "assets/images/icon-huruf.svg",
              title: "Bahasa Indonesia",
              subtitle: "Membaca Suku Kata",
            ),
            const SizedBox(
              height: 15,
            ),
            LatihanButton(
              color: red600,
              onPressed: () {
                Get.to(MembacaKataBendaView(
                  kdKelas: kdKelas,
                ));
              },
              icon: "assets/images/icon-huruf.svg",
              title: "Bahasa Indonesia",
              subtitle: "Membaca Kata Benda",
            ),
            const SizedBox(
              height: 15,
            ),
            LatihanButton(
              color: const Color(0xffFFAA00),
              onPressed: () {
                Get.to(const MenjodohkanKataView());
              },
              icon: "assets/images/icon-huruf.svg",
              title: "Bahasa Indonesia",
              subtitle: "Menjodohkan kata",
            ),
            const SizedBox(
              height: 15,
            ),
            LatihanButton(
              color: red600,
              onPressed: () {
                Get.to(MencariHurufVokalKonsonanView(
                  kdKelas: kdKelas,
                ));
              },
              icon: "assets/images/icon-huruf.svg",
              title: "Bahasa Indonesia",
              subtitle: "Mencari Huruf Vokal dan Konsonan",
            ),
            const SizedBox(
              height: 15,
            ),
            LatihanButton(
              color: blue400,
              onPressed: () {},
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
                Get.to(SoalCeritaView(
                  kdKelas: kdKelas,
                ));
              },
              icon: "assets/images/icon-huruf.svg",
              title: "Bahasa Indonesia",
              subtitle: "Belajar Menjawab Soal-Soal Cerita",
            ),
            const SizedBox(
              height: 15,
            ),
            LatihanButton(
              color: blue400,
              onPressed: () {},
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
                "Tidak ada latihan membaca untuk kelas $kdKelas",
                style: titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
    }
  }
}
