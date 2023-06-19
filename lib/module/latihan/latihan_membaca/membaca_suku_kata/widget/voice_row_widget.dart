import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core_package.dart';

class VoiceRowWidget extends StatefulWidget {
  final String titleVoice;
  final VoidCallback callback;
  final String audio;

  const VoiceRowWidget({
    Key? key,
    required this.titleVoice,
    required this.callback,
    required this.audio,
  }) : super(key: key);

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
      child: SizedBox(
        width: 200,
        child: InkWell(
          onTap: () {
            playAudio(widget.audio);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/images/icon_voice.svg'),
              Text(
                widget.titleVoice,
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
        ),
      ),
    );
  }
}
