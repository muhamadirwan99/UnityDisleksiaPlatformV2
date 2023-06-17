import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/latihan/latihan_membaca/menjodohkan_kata/widget/dot_widget.dart';

class DotPair {
  final String dot1;
  final String dot2;

  DotPair(this.dot1, this.dot2);
}

class MenjodohkanKataView extends StatelessWidget {
  const MenjodohkanKataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenjodohkanKataController>(
      init: MenjodohkanKataController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Dashboard"),
            actions: const [],
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    Get.to(const DotConnectView());
                  },
                  child: const Text("Save"),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
