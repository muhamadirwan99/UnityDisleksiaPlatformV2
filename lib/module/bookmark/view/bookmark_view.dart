import 'dart:io';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';

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
    final List<String> tabs = <String>["Pelajaran", "Informasi"];
    return GetBuilder<BookmarkController>(
      init: BookmarkController(),
      builder: (controller) {
        return Scaffold(
          body: DefaultTabController(
            length: tabs.length,
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
                        backgroundColor: blue500,
                        title: Text(
                          "Bookmark",
                          style: titleMedium,
                        ),
                        leading: InkWell(
                          onTap: () {
                            Get.to(const BerandaView());
                          },
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 24.0,
                            ),
                          ),
                        ),
                        elevation: 0.0,
                        floating: true,
                        pinned: true,
                        snap: true,
                        forceElevated: innerBoxIsScrolled,
                        bottom: TabBar(
                          indicatorColor: Colors.white,
                          tabs: tabs
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
              body: TabBarView(
                children: [
                  TabPelajaran(controller: controller),
                  const TabInformasi(),
                  // SizedBox(
                  //   child: ContentPelajaranKosongWidget(),
                  // ),
                  // const SizedBox(
                  //   child: ContentInformasiKosongWidget(),
                  // ),
                  // Column(
                  //   children: [
                  //     const CardPelajaranWidget(),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
