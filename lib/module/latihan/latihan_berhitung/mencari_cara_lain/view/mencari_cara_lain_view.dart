import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class MencariCaraLainView extends StatelessWidget {
  final String kdKelas;
  const MencariCaraLainView({Key? key, required this.kdKelas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MencariCaraLainController>(
      init: MencariCaraLainController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Latihan Berhitung"),
            leading: InkWell(
              onTap: () {
                Get.to(PilihPelajaranView(
                  kdKelas: kdKelas,
                ));
              },
              child: const Icon(
                Icons.arrow_back,
                size: 24.0,
              ),
            ),
          ),
          backgroundColor: blue100,
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    controller.title,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                          color: neutralBlack),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Image.network(
                    "https://images.unsplash.com/photo-1484517586036-ed3db9e3749e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                    width: MediaQuery.of(context).size.width - 36,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Isilah dengan jawaban yang tepat!",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                          color: neutralBlack),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 45,
                    child: ListView.builder(
                      itemCount: controller.question.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return controller.isNumber(controller.question[index])
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.5),
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                    color: blue500,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        5.0,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.question[index],
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.2,
                                            color: neutralWhite),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.5),
                                child: Container(
                                  height: 45,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    color: red500,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        5.0,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.question[index],
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.2,
                                            color: neutralWhite),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 45,
                    child: ListView.builder(
                      itemCount: controller.answerPlaceHolder.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        if (controller.answerList.length <=
                            controller.answerPlaceHolder.length) {
                          controller.answerList
                              .add(controller.answerPlaceHolder[index]);
                        }
                        return controller.isNotOperator(
                                controller.answerPlaceHolder[index])
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.5),
                                child: Container(
                                  height: 45,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    color: red500,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        5.0,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.answerPlaceHolder[index],
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.2,
                                            color: neutralWhite),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.5),
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                    color: blue500,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        5.0,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Center(
                                      child: TextField(
                                        maxLength: 2,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.2,
                                            color: Colors.white,
                                          ),
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          counterText: '',
                                          hintText: "_",
                                          hintStyle: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.2,
                                              color: Colors.white,
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          labelStyle: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.2,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        onChanged: (value) {
                                          controller.update();
                                          print("value");
                                          print(value);
                                          print(controller.answerList);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
