import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class AngkaPage extends StatelessWidget {
  const AngkaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Materi Angka',
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
                          "Ayo kita bermain sambil belajar mengenal angka",
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
                      "assets/images/angka.svg",
                      width: 107,
                      height: 118,
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
              width: MediaQuery.of(context).size.width,
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
                    Text(
                      "Pilih Angka",
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AngkaButton(value: '1'),
                        AngkaButton(value: '2'),
                        AngkaButton(value: '3'),
                        AngkaButton(value: '4'),
                        AngkaButton(value: '5'),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AngkaButton(value: '6'),
                        AngkaButton(value: '7'),
                        AngkaButton(value: '8'),
                        AngkaButton(value: '9'),
                        AngkaButton(value: '10'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
