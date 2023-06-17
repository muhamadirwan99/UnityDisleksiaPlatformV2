// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/latihan/latihan_membaca/membaca_suku_kata/widget/voice_row_widget.dart';

class ContentMembacaSukuKata extends StatefulWidget {
  const ContentMembacaSukuKata({Key? key}) : super(key: key);

  @override
  State<ContentMembacaSukuKata> createState() => _ContentMembacaSukuKataState();
}

class _ContentMembacaSukuKataState extends State<ContentMembacaSukuKata> {
  List<String> data = [
    'Cha',
    'Nu',
    'Re',
    'Tung',
    'Jok',
    'Ning',
    'Ju',
    'Kong',
    'Bis',
    'Bi',
    'Yes',
    'Tong',
  ];
  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            'Bacalah kata di bawah ini',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                  color: neutralBlack),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            height: height * 0.7,
            width: 200,
            child: ListView.builder(
              itemCount: data.length,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return VoiceRowWidget(
                  titleVoice: data[index],
                  callback: () {},
                );
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: blue300,
            ),
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Kembali',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                    color: neutralBlack),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
