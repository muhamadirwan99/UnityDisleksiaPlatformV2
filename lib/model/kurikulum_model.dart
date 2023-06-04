// To parse this JSON data, do
//
//     final kurikulum = kurikulumFromJson(jsonString);

import 'dart:convert';

Kurikulum kurikulumFromJson(String str) => Kurikulum.fromJson(json.decode(str));

String kurikulumToJson(Kurikulum data) => json.encode(data.toJson());

class Kurikulum {
  String title;
  String subtitle;
  String icon;
  String desc;
  String linkPdf;

  Kurikulum({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.desc,
    required this.linkPdf,
  });

  factory Kurikulum.fromJson(Map<String, dynamic> json) => Kurikulum(
        title: json["title"],
        subtitle: json["subtitle"],
        icon: json["icon"],
        desc: json["desc"],
        linkPdf: json["linkPdf"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "icon": icon,
        "desc": desc,
        "linkPdf": linkPdf,
      };
}
