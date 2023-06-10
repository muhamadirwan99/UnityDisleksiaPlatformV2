import 'package:flutter_svg/flutter_svg.dart';
import 'package:udp_v2/core.dart';
import 'package:get/get.dart';

class MenuNavView extends StatelessWidget {
  const MenuNavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuNavController>(
      init: MenuNavController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: IndexedStack(
            index: controller.currentIndex,
            children: controller.screens,
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0xffCECECE),
                    spreadRadius: 2,
                    blurRadius: 12,
                    offset: Offset(2, 2)),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentIndex,
              onTap: (index) {
                switch (index) {
                  case 0:
                    controller.currentIndex = index;
                    controller.update();
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchView()),
                    );
                    break;
                  case 2:
                    controller.currentIndex = index;
                    controller.update();
                    break;
                }
              },
              selectedLabelStyle: labelMedium.copyWith(color: blue600),
              unselectedLabelStyle: labelMedium.copyWith(color: gray800),
              selectedItemColor: blue600,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: SvgPicture.asset(
                      "assets/images/beranda_off.svg",
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: SvgPicture.asset(
                      "assets/images/beranda_on.svg",
                    ),
                  ),
                  label: "Beranda",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: SvgPicture.asset(
                      "assets/images/pencarian_off.svg",
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: SvgPicture.asset(
                      "assets/images/pencarian_on.svg",
                    ),
                  ),
                  label: 'Pencarian',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: SvgPicture.asset(
                      "assets/images/favorit_off.svg",
                      color: gray800,
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: SvgPicture.asset(
                      "assets/images/favorit_on.svg",
                      color: blue600,
                    ),
                  ),
                  label: 'Favorit',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
