import 'package:get/get.dart';
import 'package:udp_v2/core.dart';

class MenuNavController extends GetxController {
  MenuNavView? view;

  int currentIndex = 0;
  List<Widget> screens = [
    const BerandaView(),
    const SearchView(),
    const BookmarkView(),
    const NotifikasiView(),
  ];
}
