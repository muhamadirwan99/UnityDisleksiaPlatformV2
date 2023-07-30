import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core_package.dart';

class VoiceRowWidget extends StatefulWidget {
  final String titleVoice;
  final VoidCallback callback;
  final String audio;
  final String namaBenda;
  final String imageLink;

  const VoiceRowWidget(
      {Key? key,
      required this.titleVoice,
      required this.callback,
      required this.audio,
      required this.namaBenda,
      required this.imageLink})
      : super(key: key);

  @override
  State<VoiceRowWidget> createState() => _VoiceRowWidgetState();
}

class _VoiceRowWidgetState extends State<VoiceRowWidget> {
  @override
  Widget build(BuildContext context) {
    playAudio(String audio) async {
      final player = AudioPlayer();
      await player.play(UrlSource(audio));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: InkWell(
        onTap: () {
          playAudio(widget.audio);
        },
        child: Container(
          decoration: const BoxDecoration(
            color: gray100,
            borderRadius: BorderRadius.all(
              Radius.circular(
                16.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        20.0), // Change the value to adjust the roundness of the border
                  ),
                  child: Image.network(
                    widget.imageLink,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        height: 24,
                        width: 24,
                        child:
                            SvgPicture.asset('assets/images/icon_voice.svg')),
                    Text(
                      widget.titleVoice,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                            color: blue700),
                      ),
                    ),
                    Text(
                      widget.namaBenda,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                            color: blue500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
