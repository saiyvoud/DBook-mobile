import 'dart:convert';
import 'dart:io';
import 'package:dbook_project/model/payment_model.dart';
import 'package:dio/dio.dart';

import '../../model/address_model.dart';
import 'package:http/http.dart' as http;
import '../../model/order_model.dart';
import '../../share_preferences/share_preferences.dart';
import '../api.dart';
// import 'package:dio/dio.dart' as DIO;

class OrderApi {
  late http.Response _respone;
  // final DIO.Dio _dio = new DIO.Dio();
  final Dio dio = new Dio();
  Future<List<OrdersModel>?> getOrders() async {
    try {
      final token = await SharePreference.getAccessToken();
      final userId = await SharePreference.getUserId();
      Uri url = Uri.parse(Api.getOrder + userId.toString());
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      _respone = await http.get(url, headers: header);
      var data = jsonDecode(_respone.body);
      print("======>" + _respone.body);
      if (data['status'] == true) {
        final order = ordersModelFromJson(jsonEncode(data['data']));
        return order;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<OrderModel?> addOrder({
    required int book_id,
    required int sale_price,
    required int address_id,
    required String date,
    required File image,
  }) async {
    try {
      Uri url = Uri.parse(Api.checkout);
      final token = await SharePreference.getAccessToken();
      final userId = await SharePreference.getUserId();
      final qty = await SharePreference.getQty();
      //int total = int.parse(qty) * sale_price;
      // var map = new Map<String, dynamic>();
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final request = http.MultipartRequest('POST', url);
      request.headers.addAll(header);
      request.fields['user_id'] = userId.toString();
      request.fields['address_id'] = address_id.toString();
      request.fields['detail[0][book_id]'] = book_id.toString();
      request.fields['detail[0][qty]'] = qty.toString();
      request.fields['detail[0][sale_price]'] = sale_price.toString();
      final file = await http.MultipartFile.fromPath('image', image.path);
      request.files.add(file);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      print(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        // final Map<String, dynamic> responseData = json.decode(response.body);
        var data = json.decode(response.body);
        print("data=====>${data}");
        final OrderModel order = OrderModel.fromJson(data['data']);
        return order;
      }
    } catch (e) {
      print(e);
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
