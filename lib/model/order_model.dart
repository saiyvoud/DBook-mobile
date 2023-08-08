import 'dart:convert';

List<OrderModel> orderModelFromJson(String str) =>
    List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

class OrderModel {
  final int? id;
  final int? user_id;
  final int? address_id;
  final int? total_quantity;
  final int? total_price;
  final String? date;
  final String? image;
  final String? image_url;
  final String? status;

  OrderModel({
    this.id,
    this.user_id,
    this.address_id,
    this.total_quantity,
    this.total_price,
    this.date,
    this.image,
    this.image_url,
    this.status,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        user_id: json['user_id'],
        address_id: json['address_id'],
        total_quantity: json['total_quantity'],
        total_price: json['total_price'],
        date: json['date'],
        image: json['image'],
        image_url: json['image_url']
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": user_id,
        "address_id": address_id,
        "total_quantity": total_quantity,
        "total_price": total_price,
        "date": date,
        "image": image,
        "image_url": image_url
      };
}

List<OrdersModel> ordersModelFromJson(String str) => List<OrdersModel>.from(
    json.decode(str).map((x) => OrdersModel.fromJson(x)));

class OrdersModel {
  final int? id;
  final String? book_name;
  final int? qty;
  final int? sale_price;
  final int? user_id;
  final String? status;
  final int? total;
  final String? image;
  final String? image_url;
  OrdersModel({
    this.id,
    this.book_name,
    this.qty,
    this.sale_price,
    this.user_id,
    this.total,
    this.image,
    this.image_url,
    this.status,
  });
  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
      id: json['id'],
      user_id: json['user_id'],
      book_name: json['book_name'],
      qty: json['qty'],
      sale_price: json['sale_price'],
      image: json['image'],
      image_url: json['image_url'],
      total: json["total"],
      status: json['status']);
  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": user_id,
        "book_name": book_name,
        "qty": qty,
        "sale_price": sale_price,
        "total": total,
        "image": image,
        "image_url": image_url,
        "status": status,
      };
}
