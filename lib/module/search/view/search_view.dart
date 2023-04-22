import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/search/widget/tidak_ada_hasil_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      init: SearchController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Color(0xffFFFFFF),
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
                        onTap: () {},
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
                          onFieldSubmitted: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
                color: gray100,
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: const TidakAdaHasilWidget())),
          ),
        );
      },
    );
  }
}
