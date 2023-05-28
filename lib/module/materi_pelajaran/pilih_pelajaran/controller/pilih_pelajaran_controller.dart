import 'package:get/get.dart';
import '../view/pilih_pelajaran_view.dart';

class PilihPelajaranController extends GetxController {
  PilihPelajaranView? view;

  String kelas = "";

  switchKelas(String kdKelas) {
    switch (kdKelas) {
      case "1":
        kelas = "Kelas 1";
        break;
      case "2":
        kelas = "Kelas 2";
        break;
      case "3":
        kelas = "Kelas 3";
        break;
    }
  }
}
