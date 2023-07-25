import 'dart:convert';

List<OrderModel> orderModelFromJson(String str) => List<OrderModel>.from(
    json.decode(str).map((x) => OrderModel.fromJson(x)));

class OrderModel {
  final int? id;
  final int? user_id;
  final int? address_id;
  final int? total_quantity;
  final int? total_price;
  final String? date;
  final String? image;
  final String? status;

  OrderModel({
    this.id,
    this.user_id,
    this.address_id,
    this.total_quantity,
    this.total_price,
    this.date,
    this.image,
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
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": user_id,
        "address_id": address_id,
        "total_quantity": total_quantity,
        "total_price": total_price,
        "date": date,
        "image": image,
      };
}
