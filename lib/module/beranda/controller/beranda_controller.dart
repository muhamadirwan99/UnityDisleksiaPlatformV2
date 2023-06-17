import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/model/news_model.dart';
import 'package:udp_v2/utils/show_info_dialog.dart';

class BerandaController extends GetxController {
  BerandaView? view;
  final List<String> imageAssets = [
    'assets/images/carousel_one.svg',
    'assets/images/carousel_two.svg',
    'assets/images/carousel_three.svg',
  ];

  NewsResult data = NewsResult();

  getData() async {
    try {
      var response = await Dio().get(
        "https://api-berita-indonesia.vercel.app/sindonews/edukasi/",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.data["success"] == true) {
        data = NewsResult.fromJson(response.data);
        return;
      }
      showInfoDialog(response.data["message"].toString());
    } catch (e) {
      showInfoDialog(e.toString());
    }
  }
}
