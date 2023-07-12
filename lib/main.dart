// ignore_for_file: equal_keys_in_map

import 'package:dbook_project/Provider/VerifyPhoneAuth/PhoneAuthServiceProvider.dart';
import 'package:dbook_project/Provider/order/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/Auth/AuthService.dart';
import 'Provider/VerifyPhoneAuth/VertifyResgister.dart';
import 'Provider/category/category_provider.dart';
import 'UI/FormLogin/New_Password.dart';
import 'UI/FormLogin/OTP_Password.dart';
import 'UI/FormLogin/OTP_Register_Password.dart';
import 'UI/FormLogin/formLogin.dart';
import 'UI/FormLogin/formregister.dart';

import 'UI/Play_ment_information/Bill_Pay_dart.dart';
import 'UI/Play_ment_information/Image_Playment.dart';
import 'UI/Play_ment_information/Information_Customer.dart';

import 'UI/category_book/Category_Book.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ResetPasswordServiceProvider()),
      ChangeNotifierProvider(create: (_) => VertifyRegister()),
      ChangeNotifierProvider(create: (_) => AuthServiceProvider()),
      ChangeNotifierProvider(create: (_) => CategoriesProvider()),
      ChangeNotifierProvider(create: (_)=> OrderProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Form_Login(),
      routes: {
        Form_Regester.routeName: (ctx) => Form_Regester(),
        Categories.routeName: (ctx) => Categories(),
        Form_Regester.routeName: (ctx) => Form_Regester(),
        //Category_Detail.routeName: (ctx) => Category_Detail(),
        //Category_Book_Buy.routeName: (cxt) => Category_Book_Buy(),
        //Play_Ment_Detail.routeName: (cxt) => Play_Ment_Detail(),
        Information_Customer.routeName: (cxt) => Information_Customer(),
        Form_Login.routeName: (cxt) => Form_Login(),
        OTP_Password.routeName: (cxt) => OTP_Password(),
        New_Password.routeName: (cxt) => New_Password(),
        Bill_Pay.routeName: (cxt) => Bill_Pay(),
        Image_Playment.routeName: (cxt) => Image_Playment(),
        OTP_Register_Password.routeName: (cxt) => OTP_Register_Password(),
      },
    );
  }
}
