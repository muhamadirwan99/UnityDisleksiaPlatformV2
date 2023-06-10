// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/latihan/latihan_membaca/membedakan_huruf/widget/jawaban_benar.dart';
import 'package:udp_v2/module/latihan/latihan_membaca/membedakan_huruf/widget/jawaban_salah.dart';

class ContentLatihan extends StatefulWidget {
  const ContentLatihan({Key? key}) : super(key: key);

  @override
  State<ContentLatihan> createState() => _ContentLatihanState();
}

class _ContentLatihanState extends State<ContentLatihan> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Container(
          height: 333,
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
            children: [
              const Spacer(),
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
                '1. Manakah huruf (er)?',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
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
                  InkWell(
                    onTap: () {
                      Get.offAll(const JawabanBenarMembedakanHuruf());
                    },
                    child: Container(
                      height: 90,
                      width: 90,
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
                          'R/r',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.2,
                                color: neutralBlack),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const JawabanSalahMembedakanHuruf());
                    },
                    child: Container(
                      height: 90,
                      width: 90,
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
                          'F/f',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.2,
                                color: neutralBlack),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
