import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../view/mata_pelajaran_view.dart';

class MataPelajaranController extends GetxController {
  MataPelajaranView? view;

  dynamic materi =
      FirebaseFirestore.instance.collection("materi").doc("kelas1").snapshots();
}
