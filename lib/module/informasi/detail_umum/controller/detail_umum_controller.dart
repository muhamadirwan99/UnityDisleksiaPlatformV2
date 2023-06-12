import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../view/detail_umum_view.dart';

class DetailUmumController extends GetxController {
  DetailUmumView? view;

  String convertDateString(String dateString) {
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd MMMM yyyy', 'id_ID').format(date);
    return formattedDate;
  }

  @override
  void onInit() {
    super.onInit();
    initializeDateFormatting('id_ID', null);
  }
}
