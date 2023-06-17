import 'package:udp_v2/services/db_service.dart';

class SplashDatabase {
  static String isSplash = "";

  static load() async {
    isSplash = mainStorage.get("isSplash");
  }

  static save(
    String isSplash,
  ) async {
    mainStorage.put("isSplash", isSplash);

    SplashDatabase.isSplash = isSplash;
  }
}
