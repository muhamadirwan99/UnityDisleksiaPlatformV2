import 'dart:async';
import 'package:flutter/material.dart';
import 'package:udp_v2/core.dart';

class InitialPageController extends State<InitialPageView>
    implements MvcController {
  static late InitialPageController instance;
  late InitialPageView view;

  @override
  void initState() {
    instance = this;
    Timer(Duration(seconds: 3), () {
      Get.offAll(IntroductionView());
    });
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
