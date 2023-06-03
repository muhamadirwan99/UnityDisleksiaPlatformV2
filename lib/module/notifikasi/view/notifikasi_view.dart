import 'package:flutter/material.dart';
import '../controller/notifikasi_controller.dart';
import 'package:udp_v2/core.dart';
import 'package:get/get.dart';

class NotifikasiView extends StatelessWidget {
  const NotifikasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotifikasiController>(
      init: NotifikasiController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Notifikasi"),
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