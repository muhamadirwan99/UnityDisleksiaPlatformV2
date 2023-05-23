import 'package:udp_v2/core.dart';
import 'package:get/get.dart';
import 'package:udp_v2/module/kurikulum_pembelajaran/widget/content_kurikulum.dart';
import 'package:udp_v2/module/kurikulum_pembelajaran/widget/content_silabusrpp.dart';

class KurikulumPembelajaranView extends StatefulWidget {
  final String title;
  final int indexContent;
  KurikulumPembelajaranView(
      {Key? key, required this.title, required this.indexContent})
      : super(key: key);

  @override
  State<KurikulumPembelajaranView> createState() =>
      _KurikulumPembelajaranViewState();
}

class _KurikulumPembelajaranViewState extends State<KurikulumPembelajaranView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KurikulumPembelajaranController>(
      init: KurikulumPembelajaranController(),
      builder: (controller) {
        controller.title = widget.title;
        return (widget.indexContent == 1)
            ? const ContentKurikulum()
            : (widget.indexContent == 2)
                ? ContentSilabusRPP(
                    controller: controller,
                    index: 1,
                    title: "Silabus Pembelajaran",
                  )
                : ContentSilabusRPP(
                    controller: controller,
                    index: 2,
                    title: "RPP Pembelajaran",
                  );
      },
    );
  }
}
