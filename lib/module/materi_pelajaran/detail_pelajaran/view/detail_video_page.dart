import 'package:google_fonts/google_fonts.dart';
import 'package:udp_v2/core.dart';
import 'package:udp_v2/utils/widget/card_modul.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailVideoPage extends StatefulWidget {
  final dynamic data;

  const DetailVideoPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailVideoPage> createState() => _DetailVideoPageState();
}

class _DetailVideoPageState extends State<DetailVideoPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    var url = widget.data["linkVideo"];

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
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          title: Text(
            widget.data["namaMapel"],
          ),

          // actions: [
          //   isBookmarked
          //       ? IconButton(
          //           icon: SvgPicture.asset(
          //             "assets/icons/bookmark-fill.svg",
          //             color: blue500,
          //             height: 32,
          //             width: 32,
          //           ),
          //           onPressed: () =>
          //               provider.removeBookmark(widget.video.id),
          //         )
          //       : IconButton(
          //           icon: SvgPicture.asset(
          //             "assets/icons/bookmark.svg",
          //             color: gray900,
          //             height: 32,
          //             width: 32,
          //           ),
          //           onPressed: () {
          //             provider.addBookmark(widget.video);
          //             final snackBar = SnackBar(
          //               backgroundColor: blue100,
          //               behavior: SnackBarBehavior.floating,
          //               content: Row(
          //                 mainAxisAlignment:
          //                     MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Expanded(
          //                     flex: 2,
          //                     child: Text(
          //                       'Berhasil ditambahkan',
          //                       style: GoogleFonts.roboto(
          //                         textStyle: const TextStyle(
          //                             fontSize: 16,
          //                             fontWeight: FontWeight.w400,
          //                             letterSpacing: 0.5,
          //                             color: gray900),
          //                       ),
          //                     ),
          //                   ),
          //                   Expanded(
          //                     flex: 1,
          //                     child: ElevatedButton(
          //                       style: ElevatedButton.styleFrom(
          //                         foregroundColor: gray400,
          //                         elevation: 0.0,
          //                         backgroundColor: blue100,
          //                         shadowColor: Colors.transparent,
          //                       ),
          //                       onPressed: () {
          //                         ScaffoldMessenger.of(context)
          //                             .hideCurrentSnackBar();

          //                         Navigator.pushNamed(
          //                             context, BookmarkPage.routeName,
          //                             arguments: 0);
          //                       },
          //                       child: Row(
          //                         mainAxisSize: MainAxisSize.min,
          //                         mainAxisAlignment:
          //                             MainAxisAlignment.end,
          //                         children: [
          //                           Expanded(
          //                             child: Text(
          //                               'Lihat',
          //                               maxLines: 1,
          //                               overflow:
          //                                   TextOverflow.ellipsis,
          //                               style: GoogleFonts.roboto(
          //                                 textStyle: const TextStyle(
          //                                     fontSize: 16,
          //                                     fontWeight:
          //                                         FontWeight.w500,
          //                                     letterSpacing: 0.2,
          //                                     color: blue500),
          //                               ),
          //                             ),
          //                           ),
          //                           const SizedBox(
          //                             width: 8,
          //                           ),
          //                           SvgPicture.asset(
          //                             "assets/icons/chevron-right.svg",
          //                             color: blue500,
          //                             height: 24,
          //                             width: 24,
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               shape: const RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.all(
          //                   Radius.circular(8),
          //                 ),
          //               ),
          //             );
          //             ScaffoldMessenger.of(context)
          //                 .showSnackBar(snackBar);
          //           }),
          // ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
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
                    widget.data["namaMapel"],
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
                  widget.data["descMapel"],
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
  }
}
