// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Post> welcomeFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String welcomeToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  String? title;
  String? body;
  String? id;

  Post({
     this.title,
     this.body,
     this.id,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    title: json["title"],
    body: json["body"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
    "id": id,
  };
}
