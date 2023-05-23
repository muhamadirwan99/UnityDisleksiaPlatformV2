import 'package:udp_v2/core.dart';
import 'package:get/get.dart';

class ContentPembelajaranView extends StatelessWidget {
  const ContentPembelajaranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContentPembelajaranController>(
      init: ContentPembelajaranController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("ContentPembelajaran"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: const [],
              ),
            ),
          ),
        );
      },
    );
  }
}
