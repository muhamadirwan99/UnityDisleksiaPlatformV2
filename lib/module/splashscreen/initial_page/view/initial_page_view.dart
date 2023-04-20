import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udp_v2/common/style.dart';
import 'package:udp_v2/core.dart';
import '../controller/initial_page_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InitialPageView extends StatefulWidget {
  const InitialPageView({Key? key}) : super(key: key);

  Widget build(context, InitialPageController controller) {
    controller.view = this;

    return Scaffold(
        backgroundColor: blue600,
        body: SafeArea(
          child: Center(
            child: SvgPicture.asset('assets/images/logo_splash_screen.svg'),
          ),
        ));
  }

  @override
  State<InitialPageView> createState() => InitialPageController();
}
