import 'package:udp_v2/core.dart';
import 'package:get/get.dart';

class DetailPelajaranView extends StatelessWidget {
  final dynamic data;
  const DetailPelajaranView({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPelajaranController>(
      init: DetailPelajaranController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text(data["namaMapel"]),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: const [],
              ),
            ),
          ),
        );
      },
    );
  }
}
