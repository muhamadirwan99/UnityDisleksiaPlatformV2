// ignore_for_file: camel_case_types
import 'package:provider/provider.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/provider/informasi_database_provider.dart';
import 'package:udp_v2/utils/result_state.dart';

class TabInformasi extends StatefulWidget {
  const TabInformasi({
    Key? key,
  }) : super(key: key);

  @override
  State<TabInformasi> createState() => _TabInformasiState();
}

class _TabInformasiState extends State<TabInformasi> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InformasiDatabaseProvider>(
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
              Informasi data = provider.bookmarks[index];
              return GestureDetector(
                child: CardInformasiWidget(
                  data: data,
                ),
                onTap: () {
                  Get.to(
                    DetailInformasiView(title: data.title, data: data),
                  );
                },
              );
            },
          );
        } else if (provider.state == ResultState.NoData) {
          return const ContentInformasiKosongWidget();
        } else if (provider.state == ResultState.Error) {
          return Center(child: Text(provider.message));
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }
}
