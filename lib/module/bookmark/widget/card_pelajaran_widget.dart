import 'package:udp_v2/core.dart';

class CardPelajaranWidget extends StatefulWidget {
  const CardPelajaranWidget({Key? key}) : super(key: key);

  @override
  State<CardPelajaranWidget> createState() => _CardPelajaranWidgetState();
}

class _CardPelajaranWidgetState extends State<CardPelajaranWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.00, left: 16.0, top: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: gray300, //<-- SEE HERE
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 108,
                  width: 190,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "assets/images/images_card_pelajaran.jpg",
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                height: 108,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 108 / 2,
                      width: 130,
                      child: Text(
                        "Lala & Ciko : Belajar Membaca",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        style: titleMedium.copyWith(
                            color: const Color(0xff231F20)),
                      ),
                    ),
                    SizedBox(
                      height: 108 / 2,
                      width: 130,
                      child: Text(
                          "Dalam video ini lala dan Ciko akan menemani kamu untuk belajar mengenal huruf alfabet dan juga membaca",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                          style: bodySmall.copyWith(color: gray700)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
