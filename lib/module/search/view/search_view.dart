import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      init: SearchController(),
      builder: (controller) {
        controller.view = this;

        controller.getData();

        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: const Color(0xffFFFFFF),
            elevation: 0,
            leading: BackButton(
              color: gray900,
              onPressed: () {
                Get.back();
              },
            ),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), color: gray100),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () {
                          controller.filterData();
                          controller.update();
                        },
                        child: const Icon(
                          Icons.search,
                          size: 24.0,
                          color: gray400,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                        width: 240,
                        child: TextFormField(
                          initialValue: null,
                          decoration: const InputDecoration.collapsed(
                            filled: true,
                            fillColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            hintText: "Search",
                          ),
                          onChanged: (value) {
                            controller.query = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          body: controller.extractedDataList.isNotEmpty
              ? controller.filteredList.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16.0,
                          ),
                          ListView.builder(
                            itemCount: controller.filteredList.length,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              Informasi data = Informasi.fromJson(
                                  controller.filteredList[index]);
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: CardInformasi(
                                      title: data.title,
                                      date: data.date,
                                      image: data.image,
                                      onTap: () {
                                        Get.to(
                                          DetailInformasiView(
                                            title: "Informasi",
                                            data: data,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Container(
                          color: gray100,
                          padding: const EdgeInsets.all(10.0),
                          child: const TidakAdaHasilWidget()),
                    )
              : Center(
                  child: Container(
                      color: gray100,
                      padding: const EdgeInsets.all(10.0),
                      child: const TidakAdaHasilWidget()),
                ),
        );
      },
    );
  }
}
