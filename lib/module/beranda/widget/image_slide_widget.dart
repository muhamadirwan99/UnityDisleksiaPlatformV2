import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:udp_v2/core.dart';

class CustomImageSlideShow extends StatefulWidget {
  const CustomImageSlideShow({
    Key? key,
    required this.children,
    this.width = double.infinity,
    this.height = 200,
    this.initialPage = 0,
    this.indicatorColor,
    this.indicatorBackgroundColor = Colors.grey,
    this.onPageChanged,
    this.autoPlayInterval,
    this.isLoop = false,
    this.indicatorRadius = 3,
    this.disableUserScrolling = false,
  }) : super(key: key);
  final List<Widget> children;
  final double width;
  final double height;
  final int initialPage;
  final Color? indicatorColor;
  final Color? indicatorBackgroundColor;
  final ValueChanged<int>? onPageChanged;
  final int? autoPlayInterval;
  final bool isLoop;
  final double indicatorRadius;
  final bool disableUserScrolling;
  @override
  CustomImageSlideShowState createState() => CustomImageSlideShowState();
}

class CustomImageSlideShowState extends State<CustomImageSlideShow> {
  late final ValueNotifier<int> _currentPageNotifier;
  late final PageController _pageController;
  late final ScrollBehavior _scrollBehavior;
  Timer? _timer;
  void _onPageChanged(int index) {
    _currentPageNotifier.value = index;
    if (widget.onPageChanged != null) {
      final correctIndex = index % widget.children.length;
      widget.onPageChanged!(correctIndex);
    }
  }

  void _autoPlayTimerStart() {
    _timer?.cancel();
    _timer = Timer.periodic(
      Duration(milliseconds: widget.autoPlayInterval!),
      (timer) {
        int nextPage;
        if (widget.isLoop) {
          nextPage = _currentPageNotifier.value + 1;
        } else {
          if (_currentPageNotifier.value < widget.children.length - 1) {
            nextPage = _currentPageNotifier.value + 1;
          } else {
            return;
          }
        }
        goToPage(nextPage);
      },
    );
  }

  void goToPage(int index) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    }
  }

  void stopAutoPlay() {
    _timer?.cancel();
  }

  @override
  void initState() {
    _scrollBehavior = widget.disableUserScrolling
        ? const ScrollBehavior().copyWith(
            scrollbars: false,
            dragDevices: {},
          )
        : const ScrollBehavior().copyWith(
            scrollbars: false,
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          );
    _pageController = PageController(
      initialPage: widget.initialPage,
    );
    _currentPageNotifier = ValueNotifier(widget.initialPage);
    if (widget.autoPlayInterval != null && widget.autoPlayInterval != 0) {
      _autoPlayTimerStart();
    }
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: PageView.builder(
            scrollBehavior: _scrollBehavior,
            onPageChanged: _onPageChanged,
            itemCount: widget.isLoop ? null : widget.children.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              final correctIndex = index % widget.children.length;
              return widget.children[correctIndex];
            },
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ValueListenableBuilder<int>(
            valueListenable: _currentPageNotifier,
            builder: (context, value, child) {
              return DotsIndicator(
                dotsCount: widget.children.length,
                position: value % widget.children.length.toDouble(),
                decorator: DotsDecorator(
                  size: const Size.square(10),
                  color: gray200,
                  activeColor: blue600,
                  activeSize: const Size(40.0, 10),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
