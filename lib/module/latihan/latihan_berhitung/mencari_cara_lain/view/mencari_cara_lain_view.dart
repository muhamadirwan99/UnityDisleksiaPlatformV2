import 'package:flutter/material.dart';
import '../controller/mencari_cara_lain_controller.dart';
import 'package:udp_v2/core.dart';
import 'package:get/get.dart';

class MencariCaraLainView extends StatelessWidget {
  const MencariCaraLainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MencariCaraLainController>(
      init: MencariCaraLainController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("MencariCaraLain"),
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