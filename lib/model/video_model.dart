// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

Video videoFromJson(String str) => Video.fromJson(json.decode(str));

String videoToJson(Video data) => json.encode(data.toJson());

class Video {
  String linkModul;
  String linkVideo;
  String descMapel;
  String namaBab;
  String namaMapel;

  Video({
    required this.linkModul,
    required this.linkVideo,
    required this.descMapel,
    required this.namaBab,
    required this.namaMapel,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        linkModul: json["linkModul"],
        linkVideo: json["linkVideo"],
        descMapel: json["descMapel"],
        namaBab: json["namaBab"],
        namaMapel: json["namaMapel"],
      );

  Map<String, dynamic> toJson() => {
        "linkModul": linkModul,
        "linkVideo": linkVideo,
        "descMapel": descMapel,
        "namaBab": namaBab,
        "namaMapel": namaMapel,
      };
}
