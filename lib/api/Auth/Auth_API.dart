import 'dart:io';

import 'package:dbook_project/api/api.dart';
import 'package:dbook_project/api/base_api.dart';

import 'package:http/http.dart' as http;

class AuthAPI {
  static Future<http.Response> signIn(final data) async {
    Uri url = Uri.parse(Api.login);
    final header = {
      HttpHeaders.authorizationHeader: HttpHeaders.contentTypeHeader,
      HttpHeaders.acceptHeader: "application/json"
    };
    http.Response _respone;
    try {
      _respone = await http.post(url, headers: header, body: data);
      print(_respone.body);
    } catch (e) {
      print(e);
      _respone = BaseApi.noResponse();
    }
    return Future.value(_respone);
  }
}
