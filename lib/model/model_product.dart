// class Product {
//
//
//   Product({
//     required this.id,
//     required this.name,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//   int id;
//   String name;
//   int createdAt;
//   int updatedAt;
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['name'],
//       createdAt: (json["created_at"]),
//       updatedAt: json['updated_at'],
//     );
//   }
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "createdAt": createdAt!.toIso8601String(),
//     "updated_at": updatedAt!.toIso8601String(),
//     "image_url": imageUrl,
//   };
// }




// class Product {
//   Product({
//     this.id,
//     this.name,
//     this.createdAt,
//     this.updatedAt,
//   });
//   int? id;
//   String? name;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     id: json["id"],
//     name: json['name'],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//
//   );
//   Map<String, dynamic> toJson() => {
//     "id": id,
//      "name":name,
//     "created_at": createdAt!.toIso8601String(),
//     "updated_at": updatedAt!.toIso8601String(),
//   };
// }


class Category {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  Category(
      {this.id,
        this.name,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.imageUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}









