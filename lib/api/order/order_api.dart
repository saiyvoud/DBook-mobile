import 'dart:convert';

import '../../model/address_model.dart';
import 'package:http/http.dart' as http;

import '../../share_preferences/share_preferences.dart';
import '../api.dart';

class OrderApi {
  late http.Response _respone;

  Future<AddressModel?> insertAddress({
    required String phone,
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
        "phone": phone,
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
  Future<List<AddressModel>?> getAddress()async{
       try {
     
      final token = await SharePreference.getAccessToken();
      final userId = await SharePreference.getUserId();
      Map<String, String> header = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
       Uri url = Uri.parse(Api.getAddressByUser + userId);
      _respone = await http.get(url,  headers: header);
      print(_respone.body);
      if (_respone.statusCode == 200) {
        var data = jsonDecode(_respone.body);
        final  address = addressModelFromJson(jsonEncode(data));
        return address;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
