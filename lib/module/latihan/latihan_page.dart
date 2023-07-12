import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class LatihanPage extends StatelessWidget {
  String kdKelas;
  LatihanPage({Key? key, required this.kdKelas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        titleTextStyle: const TextStyle(color: gray900),
        elevation: 0,
        backgroundColor: blue500,
      ),
      backgroundColor: blue500,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hallo, Sahabat 👋", // Headline 2
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0,
                                color: gray100),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Ayo kita bermain sambil belajar ",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                                color: gray100),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(
                      "assets/images/latihanhome.svg",
                      width: 146,
                      height: 134,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: gray100,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
                child: Column(
                  children: [
                    kdKelas.contains("1")
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: red600,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                            onPressed: () {
                              Get.to(const AngkaPage());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/icon-angka.svg",
                                    color: gray100,
                                    height: 60,
                                    width: 60,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Materi Angka",
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0,
                                                color: gray100),
                                          ),
                                        ),
                                        Text(
                                          "Belajar Mengenal dan Menulis Angka",
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.25,
                                                color: gray100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    kdKelas.contains("1")
                        ? const SizedBox(
                            height: 32,
                          )
                        : Container(),
                    kdKelas.contains("1")
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffFFAA00),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                            onPressed: () {
                              Get.to(const HurufPage());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/icon-huruf.svg",
                                    color: gray100,
                                    height: 60,
                                    width: 60,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Materi Huruf",
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0,
                                                color: gray100),
                                          ),
                                        ),
                                        Text(
                                          "Belajar Mengenal dan Menulis Huruf",
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.25,
                                                color: gray100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    kdKelas.contains("1")
                        ? const SizedBox(
                            height: 32,
                          )
                        : Container(),
                    kdKelas.contains("2")
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: red600,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                            onPressed: () {
                              Get.to(const MenulisKalimatView());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/icon-huruf.svg",
                                    color: gray100,
                                    height: 60,
                                    width: 60,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Bahasa Indonesia",
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0,
                                                color: gray100),
                                          ),
                                        ),
                                        Text(
                                          "Belajar Menulis Kalimat dari Gambar ",
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.25,
                                                color: gray100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    kdKelas.contains("2")
                        ? const SizedBox(
                            height: 32,
                          )
                        : Container(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blue400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      onPressed: () {
                        Get.to(const InstruksiPage());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/icon-instruksi.svg",
                              color: gray100,
                              height: 60,
                              width: 60,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Instruksi",
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0,
                                          color: gray100),
                                    ),
                                  ),
                                  Text(
                                    "Informasi cara bermain",
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.25,
                                          color: gray100),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
