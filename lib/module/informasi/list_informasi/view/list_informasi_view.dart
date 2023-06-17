import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/utils/widget/card_informasi.dart';

class ListInformasiView extends StatelessWidget {
  final String kdInformasi;
  final NewsResult? data;
  const ListInformasiView({
    Key? key,
    required this.kdInformasi,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListInformasiController>(
      init: ListInformasiController(),
      builder: (controller) {
        controller.view = this;

        controller.doFilter(kdInformasi);

        return Scaffold(
          appBar: AppBar(
            title: Text(controller.title),
          ),
          body: kdInformasi == "1"
              ? ListView.builder(
                  itemCount: data!.data?.posts?.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.all(24),
                  itemBuilder: (BuildContext context, int index) {
                    Posts? dataPost = data?.data?.posts?[index];

                    return Column(
                      children: [
                        CardInformasi(
                          title: dataPost!.title.toString(),
                          date: controller
                              .convertDateString(dataPost.pubDate.toString()),
                          image: dataPost.thumbnail.toString(),
                          onTap: () {
                            Get.to(
                              DetailUmumView(
                                  title: controller.title, data: dataPost),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                      ],
                    );
                  },
                )
              : StreamBuilder(
                  stream: controller.materi,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
                        snapshot.data!;
                    Map<String, dynamic>? data = documentSnapshot.data();

                    List<dynamic>? dataList =
                        data != null ? data.values.toList() : null;

                    return SingleChildScrollView(
                      child: ListView.builder(
                        itemCount: dataList!.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        padding: const EdgeInsets.all(24),
                        itemBuilder: (context, index) {
                          Informasi data = Informasi.fromJson(dataList[index]);

                          return Column(
                            children: [
                              CardInformasi(
                                title: data.title,
                                date: data.date,
                                image: data.image,
                                onTap: () {
                                  Get.to(
                                    DetailInformasiView(
                                      title: controller.title,
                                      data: data,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
