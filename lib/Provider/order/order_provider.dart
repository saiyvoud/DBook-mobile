import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbook_project/model/address_model.dart';
import 'package:dbook_project/model/books_model.dart';
import 'package:dbook_project/model/order_model.dart';
import 'package:dbook_project/model/payment_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../api/order/order_api.dart';

import '../../share_preferences/share_preferences.dart';

class OrderProvider extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController village = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController express = TextEditingController();
  TextEditingController branch = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance.currentUser;
  final formKey = GlobalKey<FormState>();
  //
  bool _loading = false;
  bool _success = false;
  bool _update = false;
  List<String> _cartList = [];
  List<dynamic> _newCart = [];
  List<OrderModel>? _orderList;
  List<OrdersModel>? _ordersList;
  List<dynamic> _newCartFireStore = [];
  double _total = 0.0;
  OrderModel? _order;
  AddressModel? _addressModel;
  List<AddressModel>? _listAddress;
  List<PaymentModel>? _lisPayment;
  final orderService = OrderApi();
  // ------ List ------
  List<OrderModel>? get orders => _orderList;
  List<OrdersModel>? get ordersModel => _ordersList;
  List<AddressModel>? get listAddress => _listAddress;
  List<PaymentModel>? get listPayment => _lisPayment;
  OrderModel? get order => _order;
  // ------ one ------
  get isLoading => _loading;
  bool get success => _success;
  get update => _update;
  get total => _total;
  List<dynamic> get cart => _newCart;
  AddressModel? get addressModel => _addressModel;

  Future<void> addAmountCartFirebase({required String id}) async {
    final documentSnapshot = await firestore.collection("cart").doc(id).get();
    documentSnapshot.reference.update({
      "amount": documentSnapshot.data()!['amount'] + 1,
    }).then((value) async {
      await getCart();
      _success = true;
      _loading = false;
      notifyListeners();
    }).catchError((error) {
      _success = false;
      _loading = false;
      notifyListeners();
    });
  }

  Future<void> removeAmountCartFirebase({required String id}) async {
    final documentSnapshot = await firestore.collection("cart").doc(id).get();
    documentSnapshot.reference.update({
      "amount": documentSnapshot.data()!['amount'] - 1,
    }).then((value) async {
      await getCart();
      _success = true;
      _loading = false;
      notifyListeners();
    }).catchError((error) {
      _success = false;
      _loading = false;
      notifyListeners();
    });
  }

  Future<void> getOrders() async {
    _loading = true;
    final result = await orderService.getOrders();
    if (result!.isNotEmpty) {
      _ordersList = result;
      _loading = false;
      notifyListeners();
    } else {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> getTotal() async {
    _loading = true;
    var userId = await SharePreference.getUserId();
    final QuerySnapshot data = await firestore
        .collection("cart")
        .where("userID", isEqualTo: userId)
        .get();
    _total = 0.0;
    for (int i = 0; i < data.docs.length; i++) {
      _total += data.docs[i]['amount'] * data.docs[i]['sale_price'];
    }
    _loading = false;

    notifyListeners();
  }

  Future<void> getCart() async {
    _loading = true;
    try {
      var userId = await SharePreference.getUserId();
      final QuerySnapshot data = await firestore
          .collection("cart")
          .where("userID", isEqualTo: userId)
          .get();
      _newCartFireStore.clear();
      for (int i = 0; i < data.docs.length; i++) {
        _newCartFireStore.add(data.docs[i]);
      }
      //

      if (_newCartFireStore.length > 0) {
        await getTotal();
        _newCart = _newCartFireStore;
        _loading = false;
        _success = true;
        notifyListeners();
      } else {
        //
        _loading = false;
        _success = false;
        notifyListeners();
        // await getTotal();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteCart({required String id}) async {
    _loading = true;
    await firestore.collection("cart").doc(id).delete();
    _success = true;
    _loading = false;
    await getCart();
  }

  Future<void> addCart({
    required BooksModel booksModel,
    required int qty,
  }) async {
    final userId = await SharePreference.getUserId();
    try {
      final QuerySnapshot data = await firestore
          .collection("cart")
          .where("userID", isEqualTo: userId)
          .get();
      _cartList.clear();
      for (int i = 0; i < data.docs.length; i++) {
        _cartList.add(data.docs[i].id);
      }

      if (_cartList.contains(booksModel.id.toString())) {
        await firestore
            .collection("cart")
            .doc(booksModel.id.toString())
            .get()
            .then((data) async {
          data.reference.update({
            "amount": data.data()!["amount"] + qty,
          });
          await getTotal();
          _loading = false;
          _success = true;
          notifyListeners();
        });
      } else {
        await firestore.collection("cart").doc(booksModel.id.toString()).set({
          "id": booksModel.id.toString(),
          "userID": userId,
          "ISBN": booksModel.ISBN,
          "name": booksModel.name,
          "author": booksModel.author,
          "amount": qty,
          "order_price": booksModel.order_price,
          "sale_price": booksModel.sale_price,
          "created_at": booksModel.created_at,
          "updated_at": booksModel.updated_at,
          "image_url": booksModel.image_url,
        });
        await getTotal();
        _loading = false;
        _success = true;
        notifyListeners();
      }
    } catch (e) {
      print(e);
      _loading = false;
      //_success = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> addOrder({
    required int book_id,
    required double sale_price,
    required int address_id,
    required String date,
    required File image,
  }) async {
    _loading = true;

    var result = await orderService.addOrder(
      book_id: book_id,
      sale_price: sale_price,
      date: date,
      address_id: address_id,
      image: image,
    );

    if (result != null) {
      // print("================>${result.image}");
      _order = result;
      _loading = false;
      _success = true;
      notifyListeners();
    } else {
      _loading = false;
      _success = false;
      notifyListeners();
    }
  }

  Future<void> addOrderFromCart({
    required List<dynamic> books,
    required int address_id,
    required String date,
    required File image,
  }) async {
    _loading = true;

    var result = await orderService.addOrderFromCart(
      books: books,
      date: date,
      address_id: address_id,
      image: image,
    );

    if (result != null) {
      // print("================>${result.image}");
      _order = result;
      _loading = false;
      _success = true;
      notifyListeners();
    } else {
      _loading = false;
      _success = false;
      notifyListeners();
    }
  }

  Future<void> getPayments() async {
    _loading = true;
    var result = await orderService.getPayments();
    if (result != null) {
      _lisPayment = result;
      _loading = false;
      notifyListeners();
    } else {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> getAddress() async {
    _loading = true;
    var result = await orderService.getAddress();
    if (result != null) {
      //_success = true;
      _listAddress = result;
      _loading = false;
      notifyListeners();
    } else {
      _loading = false;
      //_success = false;
      notifyListeners();
    }
  }

  Future<void> insertAddress() async {
    if (formKey.currentState!.validate()) {
      _loading = true;
      var result = await orderService.insertAddress(
        phone: int.parse(phone.text.toString()),
        name: name.text,
        village: village.text,
        district: district.text,
        province: province.text,
        express: express.text,
        branch: branch.text,
      );
      print(result!.id);
      if (result.id != null) {
        _success = true;
        _addressModel = result;
        _loading = false;
        notifyListeners();
      } else {
        _loading = false;
        _success = false;
        notifyListeners();
      }
    }
  }

  Future<void> updateAddress({
    required int address_id,
    required String phone,
    required String name,
    required String village,
    required String district,
    required String province,
    required String express,
    required String branch,
  }) async {
    if (formKey.currentState!.validate()) {
      _loading = true;

      var result = await orderService.updateAddress(
        address_id: address_id,
        phone: phone,
        name: name,
        village: village,
        district: district,
        province: province,
        express: express,
        branch: branch,
      );
      //print(result!.id);
      if (result!.id != null) {
        _success = true;
        _addressModel = result;
        _loading = false;
        notifyListeners();
      } else {
        _loading = false;
        _success = false;
        notifyListeners();
      }
    }
  }

  Future<CroppedFile?> cropImage({
    required File imageFile,
    required BuildContext context,
  }) async {
    try {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.blue,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );
      return croppedFile;
    } catch (e) {
      print('Faild to crop image: ${e}');
      return null;
    }
  }

  Future<File?> pickCamera() async {
    try {
      var xImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (xImage == null) {}
      var image = File(xImage!.path);
      return image;
    } catch (e) {
      print('Faild to pick image: ${e}');
      return null;
    }
  }

  Future<File?> pickGallery() async {
    try {
      var xImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (xImage == null) {}
      var image = File(xImage!.path);
      return image;
    } catch (e) {
      print('Faild to pick image: ${e}');
      return null;
    }
  }
}
