import 'package:udp_v2/core.dart';
import 'package:get/get.dart';

class InformasiMenarikView extends StatelessWidget {
  const InformasiMenarikView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InformasiMenarikController>(
      init: InformasiMenarikController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("InformasiMenarik"),
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
