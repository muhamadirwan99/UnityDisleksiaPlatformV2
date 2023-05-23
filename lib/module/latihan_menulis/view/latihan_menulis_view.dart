import 'package:udp_v2/core.dart';
import 'package:get/get.dart';

class LatihanMenulisView extends StatelessWidget {
  const LatihanMenulisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LatihanMenulisController>(
      init: LatihanMenulisController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("LatihanMenulis"),
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
