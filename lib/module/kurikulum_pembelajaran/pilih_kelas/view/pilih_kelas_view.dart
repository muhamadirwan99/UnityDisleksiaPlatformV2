import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/utils/widget/container_content.dart';

class PilihKelasView extends StatelessWidget {
  final String kdKurikulum;
  const PilihKelasView({
    Key? key,
    required this.kdKurikulum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PilihKelasController>(
      init: PilihKelasController(),
      builder: (controller) {
        controller.view = this;
        controller.switchKurikulum(kdKurikulum);

        return Scaffold(
          appBar: AppBar(
            title: Text(controller.title),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
              child: Column(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "${controller.title} Pembelajaran",
                    style: titleLarge.copyWith(
                      color: neutralBlack,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                StreamBuilder(
                    stream: controller.materi,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }
                      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
                          snapshot.data!;
                      Map<String, dynamic>? data = documentSnapshot.data();

                      List<dynamic>? dataList =
                          data != null ? data.values.toList() : null;

                      return ListView.builder(
                        itemCount: dataList!.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          dynamic data = dataList[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: InkWell(
                              onTap: () {
                                Get.to(
                                  PilihSilabusView(
                                    data: data,
                                    title: controller.title,
                                  ),
                                );
                              },
                              child: ContainerContent(
                                titleLabel: data["title"],
                                subtitleLabel: data["subtitle"],
                                pathSvg: data["icon"],
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ]),
            ),
          ),
        );
      },
    );
  }
}
