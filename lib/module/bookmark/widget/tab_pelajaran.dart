// ignore_for_file: camel_case_types
import 'package:provider/provider.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/provider/video_database_provider.dart';
import 'package:udp_v2/utils/result_state.dart';

class TabPelajaran extends StatefulWidget {
  final BookmarkController controller;
  const TabPelajaran({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<TabPelajaran> createState() => _TabPelajaranState();
}

class _TabPelajaranState extends State<TabPelajaran> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VideoDatabaseProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (provider.state == ResultState.HasData) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: provider.bookmarks.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              Video video = provider.bookmarks[index];
              return GestureDetector(
                child: CardPelajaranWidget(
                  video: video,
                  controller: widget.controller,
                ),
                onTap: () {
                  Get.to(DetailVideoPage(data: video));
                },
              );
            },
          );
        } else if (provider.state == ResultState.NoData) {
          return const ContentPelajaranKosongWidget();
        } else if (provider.state == ResultState.Error) {
          return Center(child: Text(provider.message));
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }
}
