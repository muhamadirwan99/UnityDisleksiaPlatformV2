import 'package:flutter/material.dart';
import 'package:udp_v2/state_util.dart';
import '../view/introduction_view.dart';

class IntroductionController extends State<IntroductionView>
    implements MvcController {
  static late IntroductionController instance;
  late IntroductionView view;

  final List<String> imageAssets = [
    'assets/images/intro_one.svg',
    'assets/images/intro_two.svg',
    'assets/images/intro_three.svg',
  ];
  final List<String> textItems = [
    'Selamat Datang',
    'Pilihan tepat untuk belajar dengan menyenangkan',
    'Tingkatkan kemampuan belajarmu sekarang juga!',
  ];

  final PageController pageController = PageController();
  double index = 0.0;

  @override
  void initState() {
    instance = this;
    super.initState();
    pageController.addListener(() {
      setState(() {
        index = pageController.page!;
      });
    });
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
