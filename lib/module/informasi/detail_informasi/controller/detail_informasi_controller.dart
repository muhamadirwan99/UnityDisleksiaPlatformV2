import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../view/detail_informasi_view.dart';

class DetailInformasiController extends GetxController {
  DetailInformasiView? view;

  Future<void> launchInBrowser(String url) async {
    final Uri url0 = Uri.parse(url);

    if (!await launchUrl(
      url0,
    )) {
      throw Exception('Could not launch $url0');
    }
  }
}
