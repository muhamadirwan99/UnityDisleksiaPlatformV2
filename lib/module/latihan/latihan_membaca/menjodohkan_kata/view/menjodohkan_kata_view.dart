import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class MenjodohkanKataView extends StatelessWidget {
  const MenjodohkanKataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenjodohkanKataController>(
      init: MenjodohkanKataController(),
      builder: (controller) {
        controller.view = this;
        if (controller.items.isEmpty) controller.gameOver = true;
        return Scaffold(
          backgroundColor: blue100,
          appBar: AppBar(
            title: Text(
              'Latihan',
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
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (!controller.gameOver)
                  const SizedBox(
                    height: 20,
                  ),
                if (!controller.gameOver)
                  Text(
                    'Jodohkan huruf di bawah ini!',
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
                if (!controller.gameOver)
                  Row(
                    children: <Widget>[
                      Column(
                          children: controller.items.map((item) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Draggable<ItemModel>(
                            data: item,
                            childWhenDragging: Container(
                              height: 86.0,
                              width: 86,
                              decoration: const BoxDecoration(
                                color: blue500,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8.0,
                                  ),
                                ),
                              ),
                              child: Text(
                                item.nameAbjad,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      fontSize: 65,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.2,
                                      color: gray400),
                                ),
                              ),
                            ),
                            feedback: Container(
                              height: 86.0,
                              width: 86,
                              decoration: const BoxDecoration(
                                color: blue500,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8.0,
                                  ),
                                ),
                              ),
                              child: Text(
                                item.nameAbjad,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      fontSize: 65,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.2,
                                      color: gray100),
                                ),
                              ),
                            ),
                            child: Container(
                              height: 86.0,
                              width: 86,
                              decoration: const BoxDecoration(
                                color: blue500,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  item.nameAbjad,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                        fontSize: 56,
                                        fontWeight: FontWeight.w500,
                                        color: gray100),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList()),
                      const Spacer(),
                      Column(
                          children: controller.items2.map((item) {
                        return DragTarget<ItemModel>(
                          onAccept: (receivedItem) {
                            if (item.value == receivedItem.value) {
                              controller.items.remove(receivedItem);
                              controller.items2.remove(item);
                              item.accepting = false;
                              controller.update();
                            } else {
                              item.accepting = false;
                              controller.update();
                            }
                          },
                          onLeave: (receivedItem) {
                            item.accepting = false;
                            controller.update();
                          },
                          onWillAccept: (receivedItem) {
                            item.accepting = true;
                            controller.update();
                            return true;
                          },
                          builder: (context, acceptedItems, rejectedItem) =>
                              Container(
                            height: 86,
                            width: 86,
                            decoration: BoxDecoration(
                              color: item.accepting ? red500 : blue500,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  8.0,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                item.name,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      fontSize: 56,
                                      fontWeight: FontWeight.w500,
                                      color: gray100),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList()),
                    ],
                  ),
                if (controller.gameOver)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/materi_membedakan_huruf_finish_page.svg',
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Yeay! Kamu sudah latihan hari ini.\nTetap semangat!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.2,
                                color: neutralBlack),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: blue300,
                              ),
                              onPressed: () {
                                controller.initGame();
                                controller.update();
                              },
                              child: SizedBox(
                                width: 100,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Ulangi Kembali',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.2,
                                          color: neutralBlack),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: blue300,
                              ),
                              onPressed: () {},
                              child: SizedBox(
                                width: 100,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Kembali',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.2,
                                          color: neutralBlack),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                if (!controller.gameOver)
                  const SizedBox(
                    height: 40,
                  ),
                if (!controller.gameOver)
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      'Letakkan pasang yang tepat pada kotak kosong!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.2,
                            color: neutralBlack),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
