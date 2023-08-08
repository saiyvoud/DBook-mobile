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

  static Future<void> addQty(String qty) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("QTY", qty);
  }
   static Future<void> addCartQty(String qty) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("CARTQTY", qty);
  }

  static Future<void> addCart(String cart) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("CART", cart);
  }

  static Future<void> removeQty(String qty) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("QTY", qty);
  }
   static Future<void> deleteQty() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
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

  static Future<String> getQty() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? qty;
    qty = pref.getString("QTY") ?? "";
    return qty;
  }
  static Future<String> getCart()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? cart;
    cart = pref.getString("CART") ?? "";
    return cart;
  }
   static Future<String> getCartQty()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? cart;
    cart = pref.getString("CARTQTY") ?? "";
    return cart;
  }
}
