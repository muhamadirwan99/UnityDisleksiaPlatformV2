import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/kurikulum_pembelajaran/widget/container_content.dart';
import 'package:udp_v2/module/kurikulum_pembelajaran/widget/content_silabusrpp_menu.dart';

class ContentSilabusRPP extends StatefulWidget {
  final String title;
  final int index;
  final KurikulumPembelajaranController controller;
  const ContentSilabusRPP(
      {Key? key,
      required this.controller,
      required this.title,
      required this.index})
      : super(key: key);

  @override
  State<ContentSilabusRPP> createState() => _ContentSilabusRPPState();
}

class _ContentSilabusRPPState extends State<ContentSilabusRPP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.controller.title),
        backgroundColor: blue600,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  widget.title,
                  style: headlineSmall.copyWith(
                      color: neutralBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              (widget.index == 1)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(ContentSilabusRPPMenu(
                                  subtitleCard: (index + 1).toString(),
                                  index: 1,
                                  appBarTitle: 'Silabus',
                                  title: 'Silabus Kelas ${index + 1} SD',
                                ));
                              },
                              child: ContainerContent(
                                  pathSvg:
                                      "assets/images/icon_silabus_kelas${index + 1}.svg",
                                  titleLabel: "Kelas ${index + 1}",
                                  subtitleLabel:
                                      "Silabus Kurtilas Kelas ${index + 1} SD"),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        );
                      },
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(ContentSilabusRPPMenu(
                                  subtitleCard: (index + 1).toString(),
                                  index: 2,
                                  appBarTitle: 'RPP',
                                  title: 'RPP Kelas ${index + 1} SD',
                                ));
                              },
                              child: ContainerContent(
                                  pathSvg:
                                      "assets/images/icon_rpp_kelas${index + 1}.svg",
                                  titleLabel: "Kelas ${index + 1}",
                                  subtitleLabel:
                                      "RPP Kurtilas Kelas ${index + 1} SD"),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
