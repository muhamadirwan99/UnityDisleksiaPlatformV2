import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:get/get.dart';
import 'package:udp_v2/utils/widget/action_button.dart';

class MembacaSukuKataView extends StatelessWidget {
  const MembacaSukuKataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MembacaSukuKataController>(
      init: MembacaSukuKataController(),
      builder: (controller) {
        controller.view = this;

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
          body: const SingleChildScrollView(
            child: ContentMembacaSukuKata(),
          ),
        );
      },
    );
  }
}
