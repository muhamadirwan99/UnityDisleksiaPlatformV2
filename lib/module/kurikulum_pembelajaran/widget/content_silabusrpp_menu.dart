import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/kurikulum_pembelajaran/widget/container_content.dart';
import 'package:udp_v2/module/kurikulum_pembelajaran/widget/content_detail.dart';

class ContentSilabusRPPMenu extends StatefulWidget {
  final String subtitleCard;
  final String appBarTitle;
  final String title;
  final int index;
  const ContentSilabusRPPMenu(
      {Key? key,
      required this.subtitleCard,
      required this.index,
      required this.appBarTitle,
      required this.title})
      : super(key: key);

  @override
  State<ContentSilabusRPPMenu> createState() => _ContentSilabusRPPMenuState();
}

class _ContentSilabusRPPMenuState extends State<ContentSilabusRPPMenu> {
  @override
  Widget build(BuildContext context) {
    List<String> labelTitle = ['Matematika', 'Bahasa Indonesia', 'Agama'];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
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
              widget.index == 1
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(ContentDetail(
                                  appBarTitle: widget.appBarTitle,
                                  title: labelTitle[index],
                                  index: 1,
                                ));
                              },
                              child: ContainerContent(
                                  pathSvg:
                                      "assets/images/icon_silabus_rpp_menu${index + 1}.svg",
                                  titleLabel: labelTitle[index],
                                  subtitleLabel:
                                      "Silabus ${labelTitle[index]} kelas ${index + 1} SD"),
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
                                Get.to(ContentDetail(
                                  appBarTitle: widget.appBarTitle,
                                  title: labelTitle[index],
                                  index: 2,
                                ));
                              },
                              child: ContainerContent(
                                  pathSvg:
                                      "assets/images/icon_silabus_rpp_menu${index + 1}.svg",
                                  titleLabel: labelTitle[index],
                                  subtitleLabel:
                                      "RPP ${labelTitle[index]} kelas ${index + 1} SD"),
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
