import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/latihan/latihan_membaca/menjodohkan_kata/view/menjodohkan_kata_view.dart';

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
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        Get.to(const MembacaSukuKataView());
                      },
                      child: const Text("Membaca Suku Kata"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () {
                        Get.to(const MembacaKataBendaView());
                      },
                      child: const Text("Membaca Kata Benda"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () {
                        Get.to(const MenjodohkanKataView());
                      },
                      child: const Text("Menjodohkan Kata"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () {
                        Get.to(const MencariHurufVokalKonsonanView());
                      },
                      child: const Text("Mencari Huruf Vokal dan Konsonan"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
