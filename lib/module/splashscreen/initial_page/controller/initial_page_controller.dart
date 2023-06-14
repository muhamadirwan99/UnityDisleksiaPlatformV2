import 'dart:async';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/db/splashscreen_db.dart';

class InitialPageController extends State<InitialPageView>
    implements MvcController {
  static late InitialPageController instance;
  late InitialPageView view;

  @override
  void initState() {
    instance = this;
    Timer(const Duration(seconds: 3), () {
      SplashDatabase.isSplash == "1"
          ? Get.offAll(const MenuNavView())
          : Get.offAll(const IntroductionView());
    });
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
