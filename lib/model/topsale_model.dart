import 'dart:convert';

List<TopSaleModel> topSaleModelFromJson(String str) => List<TopSaleModel>.from(
    json.decode(str).map((x) => TopSaleModel.fromJson(x)));

class TopSaleModel {
  final String? book_name;
  final int? total_quantity_sold;
  final String? cate_name;
  final String? image_url;

  TopSaleModel({
    this.book_name,
    this.total_quantity_sold,
    this.cate_name,
    this.image_url,
  });
  factory TopSaleModel.fromJson(Map<String, dynamic> json) => TopSaleModel(
        book_name: json['book_name'],
        total_quantity_sold: json['total_quantity_sold'],
        cate_name: json['cate_name'],
        image_url: json['image_url'],
      );
  Map<String, dynamic> toJson() => {
        "book_name": book_name,
        "total_quantity_sold": total_quantity_sold,
        "cate_name": cate_name,
        "image_url": image_url,
      };
}
