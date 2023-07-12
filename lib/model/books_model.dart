import 'dart:convert';

List<BooksModel> booksModelFromJson(String str) =>
    List<BooksModel>.from(json.decode(str).map((x) => BooksModel.fromJson(x)));

class BooksModel {
  final int? id;
  final String? ISBN;
  final String? name;
  final String? author;
  final String? quantity;
  final int? order_price;
  final int? sale_price;
  final String? created_at;
  final String? updated_at;
  final String? image_url;

  BooksModel({
    this.id,
    this.ISBN,
    this.author,
    this.quantity,
    this.order_price,
    this.sale_price,
    this.created_at,
    this.updated_at,
    this.image_url,
    this.name,
  });
  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        id: json['id'],
        ISBN: json['ISBN'],
        name: json['name'],
        author: json['author'],
        quantity: json['quantity'],
        order_price: json['order_price'],
        sale_price: json['sale_price'],
        created_at: json['created_at'],
        updated_at: json['updated_at'],
        image_url: json['image_url'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "ISBN": ISBN,
        "name": name,
        "author": author,
        "quantity": quantity,
        "order_price": order_price,
        "sale_price": sale_price,
        "created_at": created_at,
        "updated_at": updated_at,
        "image_url": image_url,
      };
}
