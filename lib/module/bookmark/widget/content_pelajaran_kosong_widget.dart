// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udp_v2/core.dart';

class ContentPelajaranKosongWidget extends StatefulWidget {
  const ContentPelajaranKosongWidget({Key? key}) : super(key: key);

  @override
  State<ContentPelajaranKosongWidget> createState() =>
      _ContentPelajaranKosongWidgetState();
}

class _ContentPelajaranKosongWidgetState
    extends State<ContentPelajaranKosongWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/images/ilustrasi_pelajaran_kosong.svg"),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Belum ada Pembelajaran di Bookmark",
          style: bodyMedium.copyWith(color: gray500),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Tambahkan Pembelajaran?",
          style: titleMedium.copyWith(color: blue600),
        ),
      ],
    );
  }
}
