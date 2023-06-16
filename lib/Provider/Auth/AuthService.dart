import 'dart:convert';

import 'package:dbook_project/api/Auth/Auth_API.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../UI/Navigation_MainPage.dart';
import '../../UI/home_page.dart';
import '../../share_preferences/share_preferences.dart';

class AuthServiceProvider extends ChangeNotifier {


  TextEditingController phoneLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();

  Future<void> Login(BuildContext context) async {
    final data = {
      "phone": phoneLoginController.text,
      "password": passwordLoginController.text,
    };

    final respone = await AuthAPI.signIn(data);
    final jsonRes = jsonDecode(respone.body)["data"];
    if (respone.statusCode == 200 || respone.statusCode == 201) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) =>NavigationMainPage()));
      await SharePreference.setAccessToken(jsonRes["access_token"]);
    }
  }
}
