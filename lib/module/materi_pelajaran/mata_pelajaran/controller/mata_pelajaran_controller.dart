import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../view/mata_pelajaran_view.dart';

class MataPelajaranController extends GetxController {
  MataPelajaranView? view;

  dynamic materi = dynamic;

  switchMateri(String kdKelas) {
    switch (kdKelas) {
      case "1":
        materi = FirebaseFirestore.instance
            .collection("materi")
            .doc("kelas1")
            .snapshots();
        break;
      case "2":
        materi = FirebaseFirestore.instance
            .collection("materi")
            .doc("kelas2")
            .snapshots();
        break;
      case "3":
        materi = FirebaseFirestore.instance
            .collection("materi")
            .doc("kelas3")
            .snapshots();
        break;
    }
  }
}
