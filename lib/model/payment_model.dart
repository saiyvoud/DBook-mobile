import 'dart:convert';

List<PaymentModel> paymentModelFromJson(String str) => List<PaymentModel>.from(
    json.decode(str).map((x) => PaymentModel.fromJson(x)));

class PaymentModel {
  final int? id;
  final String? name;
  final String? image_url;

  PaymentModel({
    this.id,
    this.name,
    this.image_url,
  });
  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        id: json['id'],
        name: json['name'],
        image_url: json['image_url'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": image_url,
      };
}
