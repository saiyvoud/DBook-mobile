import 'package:dbook_project/api/category/category_api.dart';
import 'package:dbook_project/model/books_model.dart';
import 'package:dbook_project/model/category_model.dart';
import 'package:flutter/material.dart';

import '../../share_preferences/share_preferences.dart';

class CategoriesProvider extends ChangeNotifier {
  bool _loading = false;
  List<CategoryModel>? _category;
  List<BooksModel>? _books;
  BooksModel? _book;
  final categoryService = CategoryApi();
  int _quantity = 1;
  List<CategoryModel>? get category => _category;
  List<BooksModel>? get books => _books;
  BooksModel? get book => _book;
  get isLoading => _loading;
  get bookLoading => _loading;
  get quentity => _quantity;
  Future<void> loading(bool status) async {
    if (status == true) {
      _loading = true;
    } else {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> addQty() async {
    final _qty = await SharePreference.getQty();
    print(_qty);
    if (_qty == "" || _qty.isEmpty) {
      _quantity += 1;
      await SharePreference.addQty(_quantity.toString());
      notifyListeners();
    } else {
      final qty = int.parse(_qty);
      _quantity = qty + 1;
      await SharePreference.addQty(_quantity.toString());
      notifyListeners();
    }
  }

  Future<void> removeQty() async {
    final _qty = await SharePreference.getQty();
    print(_qty);
    if (_qty == "" || _qty.isEmpty) {
    } else {
      final qty = int.parse(_qty);
      _quantity = qty - 1;
      await SharePreference.removeQty(_quantity.toString());
      notifyListeners();
    }
  }

  Future<void> fechCategory() async {
    loading(true);
    var result = await categoryService.fecthCategory();
    if (result!.isNotEmpty) {
      _category = result;
      loading(false);
    }
    loading(false);
  }

  Future<void> getBookByCategory({required String id}) async {
    loading(true);
    var result = await categoryService.getBookByCategory(id: id);
    if (result!.isNotEmpty) {
      _books = result;
      loading(false);
    }
    loading(false);
  }

  Future<void> fecthBook() async {
    loading(true);
    var result = await categoryService.fecthBook();
    if (result!.isNotEmpty) {
      _books = result;
      print(result.length);
      loading(false);
    }
    loading(false);
  }

  Future<void> getOneBook({required String id}) async {
    loading(true);
    var result = await categoryService.getOneBook(id: id);
    if (result != null) {
      _book = result;
      loading(false);
    }
    loading(false);
  }
}
