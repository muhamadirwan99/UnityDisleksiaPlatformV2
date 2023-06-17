import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../view/list_informasi_view.dart';

class ListInformasiController extends GetxController {
  ListInformasiView? view;

  String title = "";
  dynamic materi = dynamic;

  String convertDateString(String dateString) {
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd MMMM yyyy', 'id_ID').format(date);
    return formattedDate;
  }

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

  @override
  void onInit() {
    super.onInit();
    initializeDateFormatting('id_ID', null);
  }
}
