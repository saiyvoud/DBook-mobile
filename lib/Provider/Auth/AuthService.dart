import 'dart:convert';

import 'package:dbook_project/api/Auth/Auth_API.dart';
import 'package:flutter/material.dart';

import '../../UI/Navigation_MainPage.dart';

import '../../share_preferences/share_preferences.dart';

class AuthServiceProvider extends ChangeNotifier {
  TextEditingController phoneLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  Future<void> _loading(bool status) async {
    if (status == true) {
      loading = true;
      notifyListeners();
    } else {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> Login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      _loading(true);
      final data = {
        "phone": phoneLoginController.text,
        "password": passwordLoginController.text,
      };
      final respone = await AuthAPI.signIn(data);
      final jsonRes = jsonDecode(respone.body)["data"];
      final status = jsonDecode(respone.body)["status"];
      if (status == true) {
        _loading(false);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => NavigationMainPage()));
        await SharePreference.setAccessToken(jsonRes["token"]);
        await SharePreference.setUserId(jsonRes["id"].toString());
      }
    }
  }
}
