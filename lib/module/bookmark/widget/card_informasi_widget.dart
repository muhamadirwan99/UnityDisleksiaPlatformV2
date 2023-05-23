import 'package:udp_v2/core.dart';

class CardInformasiWidget extends StatefulWidget {
  const CardInformasiWidget({Key? key}) : super(key: key);

  @override
  State<CardInformasiWidget> createState() => _CardInformasiWidgetState();
}

class _CardInformasiWidgetState extends State<CardInformasiWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.00, left: 16.0, top: 16),
      child: Card(
        color: gray100,
        elevation: 0,
        child: Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: gray200, width: 1))),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 108,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 85,
                      width: 220,
                      child: Text(
                        "Deteksi Dini Disleksia & Berbagai Gangguan Penyerta Pada Disleksia Disleksia ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        style: titleMedium.copyWith(color: gray800),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 220,
                      child: Text("24 Oktober 2021",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                          style: bodySmall.copyWith(color: gray700)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                  height: 108,
                  width: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "assets/images/images_card_informasi.jpg",
                      fit: BoxFit.cover,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
