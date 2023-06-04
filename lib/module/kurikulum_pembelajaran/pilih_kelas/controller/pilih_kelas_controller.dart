import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../view/pilih_kelas_view.dart';

class PilihKelasController extends GetxController {
  PilihKelasView? view;

  String title = "";
  dynamic materi = dynamic;

  switchKurikulum(String kdKurikulum) {
    switch (kdKurikulum) {
      case "1":
        title = "Silabus";
        materi = FirebaseFirestore.instance
            .collection("kurikulum")
            .doc("silabus")
            .snapshots();
        break;
      case "2":
        title = "RPP";
        materi = FirebaseFirestore.instance
            .collection("kurikulum")
            .doc("rpp")
            .snapshots();
        break;
    }
  }
}
