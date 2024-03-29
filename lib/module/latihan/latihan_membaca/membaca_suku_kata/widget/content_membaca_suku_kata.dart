// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, prefer_null_aware_operators

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';

class ContentMembacaSukuKata extends StatefulWidget {
  const ContentMembacaSukuKata({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentMembacaSukuKata> createState() => _ContentMembacaSukuKataState();
}

class _ContentMembacaSukuKataState extends State<ContentMembacaSukuKata> {
  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("latihan")
            .doc("sukukata")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
              snapshot.data!;
          Map<String, dynamic>? data = documentSnapshot.data();

          List<dynamic>? dataList = data != null ? data.values.toList() : null;

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
                  height: height * 0.8,
                  width: 250,
                  child: ListView.builder(
                    itemCount: dataList![0].length,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var dataSuku = dataList[0][index];

                      return VoiceRowWidget(
                        titleVoice: dataSuku["title"],
                        audio: dataSuku["linkSound"],
                        imageLink: dataSuku["imageLink"],
                        namaBenda: dataSuku["namaBenda"],
                        callback: () {},
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          );
        });
  }
}
