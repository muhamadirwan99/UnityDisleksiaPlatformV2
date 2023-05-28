import 'package:flutter/material.dart';
import '../controller/mata_pelajaran_controller.dart';
import 'package:udp_v2/core.dart';
import 'package:get/get.dart';

class MataPelajaranView extends StatelessWidget {
  const MataPelajaranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MataPelajaranController>(
      init: MataPelajaranController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("MataPelajaran"),
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