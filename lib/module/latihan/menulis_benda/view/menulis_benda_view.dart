import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class MenulisBendaView extends StatelessWidget {
  const MenulisBendaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenulisBendaController>(
      init: MenulisBendaController(),
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
          body: SingleChildScrollView(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Text(
                    'Tulislah kata-kata di bawah ini!',
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
                    height: 60,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            "https://images.unsplash.com/photo-1484517586036-ed3db9e3749e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                            height: 250.0,
                            width: MediaQuery.of(context).size.width / 2 - 32,
                            fit: BoxFit.cover,
                          ),
                          Column(
                            children: [
                              Text(
                                "'${controller.hint}'",
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
                                width:
                                    MediaQuery.of(context).size.width / 2 - 48,
                                decoration: BoxDecoration(
                                  color:
                                      blue400, // Set the desired background color here
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.2,
                                        color: blue100),
                                  ),
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  decoration: InputDecoration(
                                    hintText: "Ketiklah namaku...",
                                    hintStyle: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.2,
                                          color: blue100),
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
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
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
                              Get.to(const FinishPageLatihanMenulis(
                                kdKelas: "1",
                              ));
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
          ),
        );
      },
    );
  }
}
