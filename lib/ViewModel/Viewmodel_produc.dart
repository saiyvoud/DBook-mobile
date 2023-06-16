// //
// //
// // import 'dart:convert';
// //
// // import 'package:flutter/cupertino.dart';
// // import 'package:provider/provider.dart';
// // import 'package:http/http.dart' as http;
// // import '../model/model_product.dart';
// //
// // // class Viewmodel_Product extends ChangeNotifier {
// // //   late BuildContext currentContext;
// // //   set context(context) {
// // //     currentContext = context;
// // //  }
// // //  }
// //
// // class ProductAPI {
// //   static Future<List<Product>> fetchProducts() async {
// //     final response = await http.get(Uri.parse('https://myapi.com/products'));
// //     if (response.statusCode == 200) {
// //       var jsonData = json.decode(response.body);
// //       List<Product> products = [];
// //       for (var p in jsonData) {
// //         Product product = Product(
// //             id: p['id'],
// //             name: p['name'],
// //             CreatedAt dateTime = DateTime.now();
// //             createdAt: DateTime.parse(p['created']),
// //             updated: DateTime.parse(p['updated'])
// //         );
// //         products.add(product);
// //       }
// //       return products;
// //     } else {
// //       throw Exception('Failed to load products');
// //     }
// //   }
// //
// //   static Future<Product> createProduct(Product product) async {
// //     final response = await http.post(Uri.parse('https://myapi.com/products'),
// //         headers: {'Content-Type': 'application/json'},
// //         body: json.encode(product.toJson())
// //     );
// //     if (response.statusCode == 201) {
// //       var jsonData = json.decode(response.body);
// //       Product createdProduct = Product.fromJson(jsonData);
// //       return createdProduct;
// //     } else {
// //       throw Exception('Failed to create product');
// //     }
// //   }
// //
// //   static Future<void> updateProduct(Product product) async {
// //     final response = await http.put(Uri.parse('https://myapi.com/products/${product.id}'),
// //         headers: {'Content-Type': 'application/json'},
// //         body: json.encode(product.toJson())
// //     );
// //     if (response.statusCode != 204) {
// //       throw Exception('Failed to update product');
// //     }
// //   }
// //
// //   static Future<void> deleteProduct(int productId) async {
// //     final response = await http.delete(Uri.parse('https://myapi.com/products/$productId'));
// //     if (response.statusCode != 204) {
// //       throw Exception('Failed to delete product');
// //     }
// //   }
// // }







//
// import 'dart:convert';
//
// import '../model/model_product.dart';
// import 'package:http/http.dart' as http;
// class ProductService {
//   static const String apiUrl = 'https://2ee1-202-62-102-187.ngrok-free.app/api/categories';
//     static Future<List<Category>> fetchProducts() async {
//     final response = await http.get(Uri.parse(apiUrl));
//
//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       final List<Category> category = [];
//
//       data.forEach((element) {
//         category.add(Category.fromJson(element));
//       });
//
//       return category;
//     } else {
//       throw Exception('Failed to fetch products from API');
//     }
//   }
//
//   static Future<Category> createProduct(Category category) async {
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(category.toJson()),
//     );
//
//     if (response.statusCode == 201) {
//       final Map<String, dynamic> data = jsonDecode(response.body);
//       return Category.fromJson(data);
//     } else {
//       throw Exception('Failed to create product');
//     }
//   }
//
//   static Future<Category> updateProduct(Category product) async {
//     final response = await http.put(
//       Uri.parse('$apiUrl/${product.id}'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(product.toJson()),
//     );
//
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = jsonDecode(response.body);
//       return Category.fromJson(data);
//     } else {
//       throw Exception('Failed to update product');
//     }
//   }
//   static Future<void> deleteProduct(int productId) async {
//     final response = await http.delete(
//       Uri.parse('$apiUrl/$productId'),
//     );
//
//     if (response.statusCode == 200) {
//       return;
//     } else {
//       throw Exception('Failed to delete product');
//     }
//   }
// }
//

