// ignore_for_file: deprecated_member_use

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:udp_v2/core.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailVideoPage extends StatefulWidget {
  final Video data;

  const DetailVideoPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailVideoPage> createState() => _DetailVideoPageState();
}

class _DetailVideoPageState extends State<DetailVideoPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    var url = widget.data.linkVideo;

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: true,
      ),
    );
  }

  @override
  void deactivate() {
    _controller.pause();

    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoDatabaseProvider>(builder: (context, provider, child) {
      return FutureBuilder<bool>(
          future: provider.isBookmarked(widget.data.namaMapel),
          builder: (context, snapshot) {
            bool isBookmarked = snapshot.data ?? false;
            return YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller,
              ),
              builder: (context, player) => Scaffold(
                appBar: AppBar(
                  title: Text(
                    widget.data.namaMapel,
                  ),
                  actions: [
                    isBookmarked
                        ? IconButton(
                            icon: SvgPicture.asset(
                              "assets/images/bookmark_on.svg",
                              color: neutralWhite,
                              height: 21,
                              width: 21,
                            ),
                            onPressed: () {
                              provider.removeBookmark(widget.data.namaMapel);
                            },
                          )
                        : IconButton(
                            icon: SvgPicture.asset(
                              "assets/images/bookmark_off.svg",
                              color: neutralWhite,
                              height: 21,
                              width: 21,
                            ),
                            onPressed: () {
                              provider.addBookmark(widget.data);
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

                                          // Navigator.pushNamed(
                                          //     context, BookmarkPage.routeName,
                                          //     arguments: 0);
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
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.roboto(
                                                  textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 0.2,
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
                  ],
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 16),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: player,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.data.namaMapel,
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          widget.data.descMapel,
                          style: bodyLarge,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        CardModul(data: widget.data),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    });
  }
}
