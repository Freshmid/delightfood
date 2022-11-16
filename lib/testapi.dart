import 'dart:convert';

List<testResep> testResepFromJson(String str) =>
    List<testResep>.from(json.decode(str).map((x) => testResep.fromMap(x)));

class testResep {
  final String title;
  final String image;
  final String category;
  final String description;
  // final String color;

  testResep(
      {required this.title,
      // required this.color,
      required this.image,
      required this.category,
      required this.description});

  factory testResep.fromMap(Map<String, dynamic> json) => testResep(
      title: json["title"],
      image: json["image"],
      category: json["category"],
      description: json["description"],
  );
}