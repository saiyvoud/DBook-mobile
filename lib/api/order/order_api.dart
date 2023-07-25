import 'dart:convert';

import 'package:dbook_project/model/payment_model.dart';

import '../../model/address_model.dart';
import 'package:http/http.dart' as http;

import '../../model/order_model.dart';
import '../../share_preferences/share_preferences.dart';
import '../api.dart';

class OrderApi {
  late http.Response _respone;
  Future<OrderModel?> insertOrder({
    
    required int book_id,
    required int sale_price,
    required String date,
      required String image,
  }) async {
    try {
      Uri url = Uri.parse(Api.postAddress);
      final token = await SharePreference.getAccessToken();
      final userId = await SharePreference.getUserId();
      final qty = await SharePreference.getQty();
      Map<String, String> header = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      int total = int.parse(qty) * sale_price;
      final body = {
        "user_id": userId,
        "book_id": book_id.toString(),
        "qty": qty,
        "sale_price": sale_price.toString(),
        "total": total.toString(),
        "date": date.toString(),
        "image": image
      };
       _respone = await http.post(url, body: body, headers: header);
       if (_respone.statusCode == 200) {
        print("========>${_respone.body}");
        var data = jsonDecode(_respone.body);
        final OrderModel order = OrderModel.fromJson(data['data']);
        return order;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<AddressModel?> insertAddress({
    required int phone,
    required String name,
    required String village,
    required String district,
    required String province,
    required String express,
    required String branch,
  }) async {
    try {
      Uri url = Uri.parse(Api.postAddress);
      final token = await SharePreference.getAccessToken();
      final userId = await SharePreference.getUserId();
      Map<String, String> header = {
        // 'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var body = {
        "user_id": userId,
        "name": name,
        "phone": phone.toString(),
        "village": village,
        "district": district,
        "province": province,
        "express": express,
        "branch": branch,
      };
      _respone = await http.post(url, body: body, headers: header);
      print(_respone.body);
      if (_respone.statusCode == 200) {
        var data = jsonDecode(_respone.body);
        final AddressModel address = AddressModel.fromJson(data['data']);
        return address;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<List<AddressModel>?> getAddress() async {
    try {
      final token = await SharePreference.getAccessToken();
      final userId = await SharePreference.getUserId();
      Map<String, String> header = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      Uri url = Uri.parse(Api.getAddressByUser + userId);
      _respone = await http.get(url, headers: header);
      print(_respone.body);
      if (_respone.statusCode == 200) {
        var data = jsonDecode(_respone.body);
        final address = addressModelFromJson(jsonEncode(data));
        return address;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<List<PaymentModel>?> getPayments() async {
    try {
      final token = await SharePreference.getAccessToken();
      Map<String, String> header = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      Uri url = Uri.parse(Api.getPayments);
      _respone = await http.get(url, headers: header);

      if (_respone.statusCode == 200 || _respone.statusCode == 201) {
        var data = jsonDecode(_respone.body);
        var result = jsonEncode(data);

        final payments = paymentModelFromJson(result);
        return payments;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
