

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(
    json.decode(str).map((x) => CategoryModel.fromJson(x)));

class CategoryModel {
  final int? id;
  final String? name;
  final String? image;
  final String? image_url;
  CategoryModel({
    this.id,
    this.name,
    this.image,
    this.image_url,
  });
  factory CategoryModel.fromJson(Map<String,dynamic>json)=> CategoryModel(
    id: json['id'],
    name: json['name'],
    image: json['image'],
    image_url: json['image_url'],
  );
  Map<String,dynamic> toJson()=>{
    "id": id,
    "name": name,
    "image": image,
    "image_url": image_url,
  };
}
