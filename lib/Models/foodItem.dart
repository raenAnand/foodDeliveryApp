// To parse this JSON data, do
//
//     final foodItem = foodItemFromJson(jsonString);

import 'dart:convert';

FoodItem foodItemFromJson(String str) => FoodItem.fromJson(json.decode(str));

String foodItemToJson(FoodItem data) => json.encode(data.toJson());

class FoodItem {
  FoodItem({
    this.imagePath,
    this.name,
    this.description,
    this.stats,
    this.price,
  });

  String imagePath;
  String name;
  String description;
  Stats stats;
  String price;

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
    imagePath: json["imagePath"],
    name: json["name"],
    description: json["description"],
    stats: Stats.fromJson(json["stats"]),
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "imagePath": imagePath,
    "name": name,
    "description": description,
    "stats": stats.toJson(),
    "price": price,
  };
}

class Stats {
  Stats();

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
  );

  Map<String, dynamic> toJson() => {
  };
}
