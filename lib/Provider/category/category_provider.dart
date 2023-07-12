import 'package:dbook_project/api/category/category_api.dart';
import 'package:dbook_project/model/books_model.dart';
import 'package:dbook_project/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  bool _loading = false;
  List<CategoryModel>? _category;
  List<BooksModel>? _books;
  BooksModel? _book;
  final categoryService = CategoryApi();

  List<CategoryModel>? get category => _category;
  List<BooksModel>? get books => _books;
  BooksModel? get book => _book;
  get isLoading => _loading;
  get bookLoading => _loading;

  Future<void> loading(bool status) async {
    if (status == true) {
      _loading = true;
    } else {
      _loading = false;
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
 Future<void> getBookByCategory({required String id})async {
   loading(true);
   var result = await categoryService.getBookByCategory(id: id);
   if(result!.isNotEmpty){
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
