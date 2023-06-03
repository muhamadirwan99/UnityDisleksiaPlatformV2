import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../view/list_informasi_view.dart';

class ListInformasiController extends GetxController {
  ListInformasiView? view;

  String title = "";
  dynamic materi = dynamic;

  doFilter(String kdInformasi) {
    switch (kdInformasi) {
      case "1":
        title = "Informasi Umum";
        materi = FirebaseFirestore.instance
            .collection("informasi")
            .doc("umum")
            .snapshots();
        break;
      case "2":
        title = "Informasi Webinar";
        materi = FirebaseFirestore.instance
            .collection("informasi")
            .doc("webinar")
            .snapshots();
        break;
      case "3":
        title = "Kiat Membimbing Anak";
        materi = FirebaseFirestore.instance
            .collection("informasi")
            .doc("kiat")
            .snapshots();
        break;
      case "4":
        title = "Informasi Kursus Disleksia";
        materi = FirebaseFirestore.instance
            .collection("informasi")
            .doc("kursus")
            .snapshots();
        break;
      case "5":
        title = "Informasi Terapi Disleksia";
        materi = FirebaseFirestore.instance
            .collection("informasi")
            .doc("terapi")
            .snapshots();
        break;
      default:
    }
  }
}
