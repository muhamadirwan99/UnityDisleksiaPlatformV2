import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/latihan/menulis_kalimat/widget/finish_page.dart';

class MenulisKalimatView extends StatelessWidget {
  const MenulisKalimatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenulisKalimatController>(
      init: MenulisKalimatController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Latihan Menulis',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                    color: gray100),
              ),
            ),
            titleTextStyle: const TextStyle(color: gray900),
            elevation: 0,
            backgroundColor: blue500,
            actions: const [
              ActionButton(),
            ],
          ),
          backgroundColor: blue100,
          body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("latihan")
                  .doc("menuliskalimat")
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }
                DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
                    snapshot.data!;
                Map<String, dynamic>? data = documentSnapshot.data();

                List<dynamic>? dataList =
                    data != null ? data.values.toList() : null;

                if (controller.lengthLatihan < dataList![0].length) {
                  controller.imageLink =
                      dataList[0][controller.lengthLatihan]["imageLink"];
                  controller.narasi =
                      dataList[0][controller.lengthLatihan]["narasi"];
                  controller.question =
                      dataList[0][controller.lengthLatihan]["question"];
                }
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 40),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Text(
                          'Jawablah dengan saksama!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.2,
                                color: neutralBlack),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        FancyShimmerImage(
                          imageUrl: controller.imageLink,
                          height: 250.0,
                          boxFit: BoxFit.fitWidth,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          controller.narasi,
                          style: GoogleFonts.roboto(
                            height: 1.5,
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                                color: neutralBlack),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          controller.question,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                                color: neutralBlack),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                blue400, // Set the desired background color here
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            controller: controller.textEditingController,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.2,
                                  color: neutralBlack),
                            ),
                            textCapitalization: TextCapitalization.characters,
                            decoration: InputDecoration(
                              hintText: "Isi jawaban mu disini...",
                              hintStyle: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.2,
                                    color: neutralBlack),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: blue400, width: 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: blue400, width: 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              controller.checkAsnwer(value);
                            },
                          ),
                        ),
                        controller.isTrue
                            ? const SizedBox(
                                height: 20,
                              )
                            : Container(),
                        controller.isTrue
                            ? SizedBox(
                                width: 100,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: blue400,
                                  ),
                                  onPressed: () {
                                    controller.lengthLatihan++;
                                    if (controller.lengthLatihan <
                                        dataList[0].length) {
                                      controller.realAnswer = dataList[0]
                                              [controller.lengthLatihan]
                                          ["realAnswer"];
                                      controller.textEditingController.clear();
                                      controller.isTrue = false;
                                      controller.update();
                                    } else {
                                      Get.offAll(
                                        const FinishPageLatihanMenulis(
                                          kdKelas: "2",
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Lanjut',
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.2,
                                          color: neutralBlack),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
