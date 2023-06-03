import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';

class ListInformasiView extends StatelessWidget {
  final String kdInformasi;
  const ListInformasiView({
    Key? key,
    required this.kdInformasi,
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
          body: StreamBuilder(
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
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemBuilder: (context, index) {
                    Informasi data = Informasi.fromJson(dataList[index]);

                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                      ),
                      child: CardInformasi(
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
