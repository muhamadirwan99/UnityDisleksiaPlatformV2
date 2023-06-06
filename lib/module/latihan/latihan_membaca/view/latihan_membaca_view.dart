import 'package:flutter/material.dart';
import '../controller/latihan_membaca_controller.dart';
import 'package:udp_v2/core.dart';
import 'package:get/get.dart';

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
                children: const [],
              ),
            ),
          ),
        );
      },
    );
  }
}