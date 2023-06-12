import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/module/latihan/latihan_membaca/membaca_kata_benda/widget/text_field_widget.dart';

class ContentMembacaKataBenda extends StatefulWidget {
  final String imageAsset;
  final List<String> arrayQuestion;
  final List<String> arrayAnswerChoice;
  final List<String> arrayAnswer;

  const ContentMembacaKataBenda(
      {Key? key,
      required this.imageAsset,
      required this.arrayQuestion,
      required this.arrayAnswerChoice,
      required this.arrayAnswer})
      : super(key: key);

  @override
  State<ContentMembacaKataBenda> createState() =>
      Content_MembacaKataBendaState();
}

class Content_MembacaKataBendaState extends State<ContentMembacaKataBenda> {
  @override
  Widget build(BuildContext context) {
    MembacaKataBendaController controller = MembacaKataBendaController.instance;
    controller.tempArrayAnswer = widget.arrayAnswer;
    controller.tempArrayAnswerChoice = widget.arrayAnswerChoice;
    controller.tempArrayQuestion = widget.arrayQuestion;
    controller.update();
    print("MembacaKataBendaController.instance.tempArrayQuestion");
    print(controller.tempArrayQuestion);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          'Lengkapilah Huruf di Bawah Ini!',
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
        Image.network(
          "https://images.unsplash.com/photo-1484517586036-ed3db9e3749e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
          height: 200.0,
          width: 160,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          height: 80,
          alignment: Alignment.center,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.arrayQuestion.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: TextFieldWidget(text: widget.arrayQuestion[index]),
              );
            },
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          'Pilihlah huruf yang Tepat',
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
        Container(
          height: 80,
          alignment: Alignment.center,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.tempArrayAnswerChoice.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  controller.removeAnswerChoice(
                      index, controller.tempArrayAnswerChoice[index]);
                  controller.update();
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFieldWidget(
                      text: controller.tempArrayAnswerChoice[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
