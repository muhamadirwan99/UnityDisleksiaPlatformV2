// ignore_for_file: prefer_null_aware_operators

import 'package:google_fonts/google_fonts.dart';
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:udp_v2/core.dart';

class ContentLatihan extends StatefulWidget {
  final String kdKelas;
  final MembedakanHurufController controller;

  const ContentLatihan({
    Key? key,
    required this.kdKelas,
    required this.controller,
  }) : super(key: key);

  @override
  State<ContentLatihan> createState() => _ContentLatihanState();
}

class _ContentLatihanState extends State<ContentLatihan> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("latihan")
            .doc("membedakanhuruf")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
              snapshot.data!;
          Map<String, dynamic>? data = documentSnapshot.data();

          List<dynamic>? dataList = data != null ? data.values.toList() : null;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: blue100,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      8.0,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 96,
                    ),
                    Text(
                      'Pilihlah huruf yang tepat!',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                            color: neutralBlack),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      widget.controller.soal,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2,
                            color: neutralBlack),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ListView.builder(
                          itemCount: dataList![0]
                                  [widget.controller.lengthLatihan]["answers"]
                              .length,
                          scrollDirection: dataList[0]
                                              [widget.controller.lengthLatihan]
                                          ["answers"][0]["answer"]
                                      .length ==
                                  3
                              ? Axis.horizontal
                              : Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return dataList[0][widget.controller.lengthLatihan]
                                            ["answers"][index]["answer"]
                                        .length ==
                                    3
                                ? Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: InkWell(
                                      onTap: () {
                                        if (dataList[0][
                                                widget.controller.lengthLatihan]
                                            ["answers"][index]["value"]) {
                                          widget.controller.lengthLatihan++;

                                          if (widget.controller.lengthLatihan <
                                              dataList[0].length) {
                                            widget.controller.soal = dataList[0]
                                                [widget.controller
                                                    .lengthLatihan]["soal"];
                                            widget.controller.update();
                                          } else {
                                            Get.to(FinalPageVokalKonsonanWidget(
                                              kdKelas: widget.kdKelas,
                                            ));
                                          }
                                        } else {
                                          Get.to(
                                              const JawabanSalahMembedakanHuruf());
                                        }
                                        print(
                                            "widget.controller.lengthLatihan");
                                        print(widget.controller.lengthLatihan);
                                      },
                                      child: SizedBox(
                                        child: Center(
                                          child: Container(
                                            height: 120,
                                            width: 120,
                                            decoration: const BoxDecoration(
                                              color: blue300,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  8,
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                dataList[0][widget.controller
                                                            .lengthLatihan]
                                                        ["answers"][index]
                                                    ["answer"],
                                                style: GoogleFonts.roboto(
                                                  textStyle: const TextStyle(
                                                      fontSize: 45,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      letterSpacing: 0.2,
                                                      color: neutralBlack),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: InkWell(
                                      onTap: () {
                                        if (dataList[0][
                                                widget.controller.lengthLatihan]
                                            ["answers"][index]["value"]) {
                                          widget.controller.lengthLatihan++;

                                          if (widget.controller.lengthLatihan <
                                              dataList[0].length) {
                                            widget.controller.soal = dataList[0]
                                                [widget.controller
                                                    .lengthLatihan]["soal"];
                                            widget.controller.update();
                                          } else {
                                            Get.to(FinalPageVokalKonsonanWidget(
                                              kdKelas: widget.kdKelas,
                                            ));
                                          }
                                        } else {
                                          Get.to(
                                              const JawabanSalahMembedakanHuruf());
                                        }
                                        print(
                                            "widget.controller.lengthLatihan");
                                        print(widget.controller.lengthLatihan);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Container(
                                          height: 90,
                                          width: 200,
                                          decoration: const BoxDecoration(
                                            color: blue300,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                8,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              dataList[0][widget
                                                      .controller.lengthLatihan]
                                                  ["answers"][index]["answer"],
                                              style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                    fontSize: 36,
                                                    fontWeight: FontWeight.w400,
                                                    letterSpacing: 0.2,
                                                    color: neutralBlack),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
