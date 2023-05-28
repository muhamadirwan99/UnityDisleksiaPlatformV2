import 'package:flutter/material.dart';
import '../controller/detail_pelajaran_controller.dart';
import 'package:udp_v2/core.dart';
import 'package:get/get.dart';

class DetailPelajaranView extends StatelessWidget {
  const DetailPelajaranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPelajaranController>(
      init: DetailPelajaranController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("DetailPelajaran"),
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