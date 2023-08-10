import 'dart:convert';

List<CartModel> cartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

class CartModel {
  final int? id;
  final String? ISBN;
  final String? name;
  final String? author;
  // final String? quantity;
  final int? amount;
  final int? order_price;
  final int? sale_price;
  final String? created_at;
  final String? updated_at;
  final String? image_url;

  CartModel({
    this.id,
    this.ISBN,
    this.author,
    // this.quantity,
    this.order_price,
    this.sale_price,
    this.created_at,
    this.updated_at,
    this.image_url,
    this.amount,
    this.name,
  });
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'],
        ISBN: json['ISBN'],
        name: json['name'],
        author: json['author'],
        // quantity: json['quantity'],
        order_price: json['order_price'],
        sale_price: json['sale_price'],
        amount: json['amount'],
        created_at: json['created_at'],
        updated_at: json['updated_at'],
        image_url: json['image_url'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "ISBN": ISBN,
        "name": name,
        "author": author,
        // "quantity": quantity,
        "order_price": order_price,
        "sale_price": sale_price,
        "created_at": created_at,
        "updated_at": updated_at,
        "amount": amount,
        "image_url": image_url,
      };
}
