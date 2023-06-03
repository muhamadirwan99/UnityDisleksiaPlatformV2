// To parse this JSON data, do
//
//     final informasi = informasiFromJson(jsonString);

import 'dart:convert';

Informasi informasiFromJson(String str) => Informasi.fromJson(json.decode(str));

String informasiToJson(Informasi data) => json.encode(data.toJson());

class Informasi {
  String title;
  String desc;
  String date;
  String link;
  String image;

  Informasi({
    required this.title,
    required this.desc,
    required this.date,
    required this.link,
    required this.image,
  });

  factory Informasi.fromJson(Map<String, dynamic> json) => Informasi(
        title: json["title"],
        desc: json["desc"],
        date: json["date"],
        link: json["link"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "desc": desc,
        "date": date,
        "link": link,
        "image": image,
      };
}
