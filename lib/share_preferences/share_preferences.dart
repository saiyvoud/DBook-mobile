import 'package:shared_preferences/shared_preferences.dart';

class SharePreference {
  static Future<void> setAccessToken(String accessToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("ACCESS_TOKEN_KEY", accessToken);
  }

  static Future<void> setUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("USER_ID", userId);
  }

  static Future<String> getAccessToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken;
    authToken = pref.getString("ACCESS_TOKEN_KEY") ?? "";
    return authToken;
  }

  static Future<String> getUserId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId;
    userId = pref.getString("USER_ID") ?? "";
    return userId;
  }
}
