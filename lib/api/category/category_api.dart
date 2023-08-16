import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../model/books_model.dart';
import '../../model/category_model.dart';

import '../../share_preferences/share_preferences.dart';
import '../api.dart';

class CategoryApi {
  late http.Response _respone;
  Future<List<BooksModel>?> getTopSale() async {
    try {
      Uri url = Uri.parse(Api.getTopSale);
      final token = await SharePreference.getAccessToken();
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      _respone = await http.get(url, headers: header);
      var data = jsonDecode(_respone.body);
      print(data);
      if (data['status'] == true) {
        final books = booksModelFromJson(jsonEncode(data['data']));
        return books;
      }
    } catch (e) {
      throw e;
    }
    return null;
  }
    Future<List<BooksModel>?> search({
      required String search
    }) async {
    try {
      Uri url = Uri.parse(Api.search + search );
      final token = await SharePreference.getAccessToken();
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      _respone = await http.get(url, headers: header);
      var data = jsonDecode(_respone.body);
      print(data);
      if (_respone.statusCode == 200 || _respone.statusCode == 201) {
        final books = booksModelFromJson(jsonEncode(data['data']));
        return books;
      }
    } catch (e) {
      throw e;
    }
    return null;
  }

  Future<List<BooksModel>?> getNewBook() async {
    try {
      Uri url = Uri.parse(Api.getNewBook);
      final token = await SharePreference.getAccessToken();
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      _respone = await http.get(url, headers: header);
      var data = jsonDecode(_respone.body);
      print(data);
      if (data['status'] == true) {
        final books = booksModelFromJson(jsonEncode(data['data']));
        return books;
      }
    } catch (e) {
      throw e;
    }
    return null;
  }

  Future<List<BooksModel>?> getBookByCategory({required String id}) async {
    try {
      Uri url = Uri.parse(Api.getBookByCategory + id);
      final token = await SharePreference.getAccessToken();
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      _respone = await http.get(url, headers: header);
      var data = jsonDecode(_respone.body);
      if (_respone.statusCode == 200) {
        print("======>${data}");
        final books = booksModelFromJson(jsonEncode(data));
        return books;
      }
    } catch (e) {
      throw e;
    }
    return null;
  }

  Future<List<CategoryModel>?> fecthCategory() async {
    try {
      Uri url = Uri.parse(Api.getCategory);
      final token = await SharePreference.getAccessToken();
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      _respone = await http.get(url, headers: header);
      if (_respone.statusCode == 200) {
        final categories = categoryModelFromJson(_respone.body);
        return categories;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<List<BooksModel>?> fecthBook() async {
    try {
      Uri url = Uri.parse(Api.getBook);
      final token = await SharePreference.getAccessToken();
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      _respone = await http.get(url, headers: header);
      if (_respone.statusCode == 200) {
        var data = jsonDecode(_respone.body);
        final books = booksModelFromJson(jsonEncode(data['data']));
        return books;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<BooksModel?> getOneBook({
    required String id,
  }) async {
    try {
      Uri url = Uri.parse(Api.getBook + "/" + id);
      final token = await SharePreference.getAccessToken();
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      _respone = await http.get(url, headers: header);
      if (_respone.statusCode == 200) {
        final BooksModel books = BooksModel.fromJson(jsonDecode(_respone.body));
        return books;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
