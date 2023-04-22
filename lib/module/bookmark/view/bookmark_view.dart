import 'dart:io';
import 'dart:math';

import 'package:udp_v2/core.dart';
import 'package:get/get.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({Key? key}) : super(key: key);

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
      length: 2,
      vsync: this,
    );
    final List<String> _tabs = <String>["Pelajaran", "Informasi"];
    return GetBuilder<BookmarkController>(
      init: BookmarkController(),
      builder: (controller) {
        return Scaffold(
          body: DefaultTabController(
            length: _tabs.length,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverSafeArea(
                      top: false,
                      bottom: Platform.isIOS ? false : true,
                      sliver: SliverAppBar(
                        backgroundColor: blue600,
                        title: Text(
                          "Bookmark",
                          style: titleMedium,
                        ),
                        elevation: 0.0,
                        floating: true,
                        pinned: true,
                        snap: true,
                        forceElevated: innerBoxIsScrolled,
                        bottom: TabBar(
                          indicatorColor: Colors.white,
                          tabs: _tabs
                              .map(
                                (String name) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    name,
                                    style: titleMedium,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: const TabBarView(
                children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
