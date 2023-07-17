import 'dart:io';

import 'package:dbook_project/model/address_model.dart';
import 'package:dbook_project/model/order_model.dart';
import 'package:dbook_project/model/payment_model.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../api/order/order_api.dart';

class OrderProvider extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController village = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController express = TextEditingController();
  TextEditingController branch = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool _loading = false;
  bool _success = false;
  List<OrderModel>? _order;
  OrderModel? _book;
  AddressModel? _addressModel;
  List<AddressModel>? _listAddress;
  List<PaymentModel>? _lisPayment;
  final orderService = OrderApi();
  // ------ List ------
  List<OrderModel>? get orders => _order;
  List<AddressModel>? get listAddress => _listAddress;
  List<PaymentModel>? get listPayment => _lisPayment;
  OrderModel? get book => _book;
  // ------ one ------
  get isLoading => _loading;
  get success => _success;
  AddressModel? get addressModel => _addressModel;

  Future<void> getPayments() async {
    _loading = true;
    var result = await orderService.getPayments();
    if (result != null) {
      print(result.length);
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
