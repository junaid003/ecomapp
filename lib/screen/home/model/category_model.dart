
// To parse this JSON data, do
//
//     final catagories = catagoriesFromJson(jsonString);

import 'dart:convert';

Catagories catagoriesFromJson(String str) => Catagories.fromJson(json.decode(str));

String catagoriesToJson(Catagories data) => json.encode(data.toJson());

class Catagories {
    String type;
    String title;
    List<Content> contents;
    String id;

    Catagories({
        required this.type,
        required this.title,
        required this.contents,
        required this.id,
    });

    factory Catagories.fromJson(Map<String, dynamic> json) => Catagories(
        type: json["type"],
        title: json["title"],
        contents: List<Content>.from(json["contents"].map((x) => Content.fromJson(x))),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "contents": List<dynamic>.from(contents.map((x) => x.toJson())),
        "id": id,
    };
}

class Content {
    String title;
    String imageUrl;

    Content({
        required this.title,
        required this.imageUrl,
    });

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        title:  json["title"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "image_url": imageUrl,
    };
}
