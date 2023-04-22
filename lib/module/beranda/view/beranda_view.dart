import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/beranda/widget/container_Informasi_lainnya_widget.dart';
import 'package:udp_v2/module/beranda/widget/container_kurikulum_widget.dart';
import 'package:udp_v2/module/beranda/widget/container_materi_pelajaran_widget.dart';

class BerandaView extends StatefulWidget {
  const BerandaView({Key? key}) : super(key: key);

  @override
  State<BerandaView> createState() => _BerandaViewState();
}

class _BerandaViewState extends State<BerandaView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BerandaController>(
      init: BerandaController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: blue600,
            elevation: 0,
            leadingWidth: 300,
            leading: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: gray100),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8.0),
                      child: SvgPicture.asset(
                        "assets/images/logo_icon.svg",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Unity Disleksia Platform",
                    style: titleMedium.copyWith(color: gray100),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(const SearchView());
                      },
                      child: const Icon(
                        Icons.search,
                        size: 24.0,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const BookmarkView());
                      },
                      child: const Icon(
                        Icons.bookmark_add_outlined,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomImageSlideShow(
                    height: 200,
                    initialPage: 0,
                    indicatorColor: blue600,
                    indicatorBackgroundColor: const Color(0xffD9D9D9),
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(controller.imageAssets[0]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(controller.imageAssets[1]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(controller.imageAssets[2]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: blue600,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 9.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Panduan aplikasi disini ya...",
                            style: titleSmall.copyWith(color: gray100),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const ContainerMateriPembelajaranWidget(),
                  const SizedBox(
                    height: 16,
                  ),
                  const ContainerInformasiLainnyaWidget(),
                  const SizedBox(
                    height: 16,
                  ),
                  const ContainerKurikulumWidget()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
