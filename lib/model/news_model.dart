class NewsResult {
  bool? success;
  String? message;
  News? data;

  NewsResult({this.success, this.message, this.data});

  NewsResult.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? News.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class News {
  String? link;
  String? description;
  String? title;
  List<Posts>? posts;

  News({this.link, this.description, this.title, this.posts});

  News.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    description = json['description'];
    title = json['title'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    data['description'] = description;
    data['title'] = title;
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String? link;
  String? title;
  String? pubDate;
  String? description;
  String? thumbnail;

  Posts(
      {this.link, this.title, this.pubDate, this.description, this.thumbnail});

  Posts.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    title = json['title'];
    pubDate = json['pubDate'];
    description = json['description'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    data['title'] = title;
    data['pubDate'] = pubDate;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
