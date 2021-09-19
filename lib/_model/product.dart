import 'package:flutter_taining_app_1/_model/category.dart';

class Product {
  late String id;
  late String name;
  String? description;
  // late List<Category> category;
  late String imageUrl;
  late double rate;

  Product({
    required this.id,
    required this.name,
    this.description,
    // required this.category,
    required this.imageUrl,
    required this.rate,
  });

  Product.fromMap(Map<String, dynamic> map) {
    this.id = map["objectId"];
    this.name = map["name"];
    this.description = map["description"];
    this.imageUrl = map["image"];
    // this.category = (map["category"] ?? [])
    //     .map<Category>((e) => Category.fromMap(e))
    //     .toList();
    this.rate = double.parse((map["price"] ?? "0").toString());
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        "objectId": id,
        "name": name,
        // "category": category,
        "description": description,
        "image": imageUrl,
        "price": rate
      };
}
