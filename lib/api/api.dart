import 'help_api_dart.dart';

class Api {
  //-------- auth --------
  static String login = "${endPoint}/login";
  static String register = "${endPoint}/register";
  //-------- categories -------
  static String addCategory = "${endPoint}/categories";
  static String getCategory = "${endPoint}/categories";
  static String updateCategory = "${endPoint}/categories";
  static String deleteCategory = "${endPoint}/categories";
  //-------- books -----------
  static String getBook = "${endPoint}/books";
  static String getBookByCategory = "${endPoint}/books/by-category/";
  static String postBook = "${endPoint}/books";
  static String getOneBook = "${endPoint}/books/";
  static String updateOneBook = "${endPoint}/books/";
  static String deleteOneBook = "${endPoint}/books/";
  static String search = "${endPoint}/search?name=";
  static String getTopSale = "${endPoint}/topsale";
  static String getNewBook = "${endPoint}/booklatest";
  // --------- supplies -----
  static String addSupplies = "${endPoint}/supplies";
  static String getSupplies = "${endPoint}/supplies";
  static String updateSupplies = "${endPoint}/supplies";
  static String deleteSupplies = "${endPoint}/supplies";
  // --------- check out -------
  static String checkout = "${endPoint}/check-out";
  static String getPayments = "${endPoint}/payments";
  static String addPayment = "${endPoint}/payment";
  // --------- address ---------
  static String getOneAddress = "${endPoint}/customer-addresses/";
  static String getAddressByUser = "${endPoint}/customer-addresses/";
  static String postAddress = "${endPoint}/customer-addresses";
  static String updateAddress= "${endPoint}/customer-addresses/";
  static String deleteAddress= "${endPoint}/customer-addresses/";
  // order
  static String getOrder = "${endPoint}/getSalesByUserId/";
 
}
