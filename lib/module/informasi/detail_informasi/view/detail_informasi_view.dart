import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:udp_v2/core.dart';
import 'package:get/get.dart';
import 'package:udp_v2/provider/informasi_database_provider.dart';
import 'package:udp_v2/utils/widget/action_button.dart';

class DetailInformasiView extends StatelessWidget {
  final String title;
  final Informasi data;
  const DetailInformasiView({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailInformasiController>(
      init: DetailInformasiController(),
      builder: (controller) {
        controller.view = this;

        return Consumer<InformasiDatabaseProvider>(
            builder: (context, provider, child) {
          return FutureBuilder<bool>(
              future: provider.isBookmarked(data.title),
              builder: (context, snapshot) {
                bool isBookmarked = snapshot.data ?? false;
                return Scaffold(
                  appBar: AppBar(
                    title: Text(title),
                    actions: const [
                      ActionButton(),
                    ],
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  floatingActionButton: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, -1),
                        ),
                      ],
                      color: gray100,
                    ),
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 16,
                      right: 24,
                      left: 24,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: blue500, width: 2),
                          ),
                          child: isBookmarked
                              ? IconButton(
                                  icon: SvgPicture.asset(
                                    "assets/images/bookmark_on.svg",
                                    color: blue500,
                                    height: 21,
                                    width: 21,
                                  ),
                                  onPressed: () {
                                    provider.removeBookmark(data.title);
                                  },
                                )
                              : IconButton(
                                  icon: SvgPicture.asset(
                                    "assets/images/bookmark_off.svg",
                                    color: blue500,
                                    height: 21,
                                    width: 21,
                                  ),
                                  onPressed: () {
                                    provider.addBookmark(data);
                                    final snackBar = SnackBar(
                                      backgroundColor: blue100,
                                      behavior: SnackBarBehavior.floating,
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              'Berhasil ditambahkan',
                                              style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    letterSpacing: 0.5,
                                                    color: gray900),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: gray400,
                                                elevation: 0.0,
                                                backgroundColor: blue100,
                                                shadowColor: Colors.transparent,
                                              ),
                                              onPressed: () {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Lihat',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                letterSpacing:
                                                                    0.2,
                                                                color: blue500),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  const Icon(
                                                    Icons.chevron_right,
                                                    color: blue500,
                                                    size: 24,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }),
                        ),
                        const SizedBox(
                          width: 24.0,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: blue500,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: () {
                              controller.launchInBrowser(data.link);
                            },
                            child: Text(
                              "Daftar",
                              style: titleMedium.copyWith(color: neutralWhite),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 16, right: 16, left: 16, bottom: 90),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            child: Center(
                              child: FancyShimmerImage(
                                imageUrl: data.image,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 32.0,
                          ),
                          Text(
                            data.title,
                            style: titleLarge.copyWith(color: gray900),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            data.date,
                            style: titleMedium.copyWith(color: blue800),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            data.desc,
                            style: bodyMedium.copyWith(
                              color: gray800,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
      },
    );
  }
}
