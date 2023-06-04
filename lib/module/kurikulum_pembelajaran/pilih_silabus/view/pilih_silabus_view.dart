import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/utils/widget/container_content.dart';

class PilihSilabusView extends StatelessWidget {
  final dynamic data;
  final String title;
  const PilihSilabusView({
    Key? key,
    required this.data,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PilihSilabusController>(
      init: PilihSilabusController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "$title ${data["title"]} SD",
                      style: titleLarge.copyWith(
                        color: neutralBlack,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ListView.builder(
                    itemCount: data["mapel"].length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      Kurikulum dataKurikulum =
                          Kurikulum.fromJson(data["mapel"][index]);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: InkWell(
                          onTap: () {
                            Get.to(DetailSilabusView(
                              dataKurikulum: dataKurikulum,
                              title: title,
                            ));
                          },
                          child: ContainerContent(
                            titleLabel: dataKurikulum.title,
                            subtitleLabel: dataKurikulum.subtitle,
                            pathSvg: dataKurikulum.icon,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
