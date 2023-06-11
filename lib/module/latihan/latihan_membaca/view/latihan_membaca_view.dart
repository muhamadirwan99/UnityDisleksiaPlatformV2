import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';

class LatihanMembacaView extends StatelessWidget {
  const LatihanMembacaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LatihanMembacaController>(
      init: LatihanMembacaController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("LatihanMembaca"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      Get.to(const MembedakanHurufView());
                    },
                    child: const Text("Membedakan Huruf"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      Get.to(const MembedakanHurufView());
                    },
                    child: const Text("Membaca Suku Kata"),
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
