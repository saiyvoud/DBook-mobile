import 'dart:convert';

import 'package:dbook_project/api/help_api_dart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../UI/FormLogin/OTP_Register_Password.dart';

class VertifyRegister extends ChangeNotifier {

  TextEditingController name= TextEditingController();
  TextEditingController laseName= TextEditingController();
  TextEditingController date= TextEditingController();
  TextEditingController phoneNumber= TextEditingController();
  TextEditingController passWord= TextEditingController();
  
  TextEditingController otpController= TextEditingController();
  String verificationId="";
  bool codeSent = false;
  int reSend=0;
  BuildContext? context;
  String? firebaseToken="";
  Future<void> verifyPhone() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    final PhoneVerificationCompleted verificationCompleted = (PhoneAuthCredential phoneAuthCredential) async {
      //Auto Recieve OTP And Access
      try{
        final UserCredential credential = await auth.signInWithCredential(phoneAuthCredential);
        final idToken = await credential.user?.getIdToken();
        print("firebase Token:$idToken");
        debugPrint(idToken, wrapWidth: 1024);
        this.firebaseToken = idToken;
      }catch(e){
        print("Error VerifyPhone: $e");
      }
    };

    final PhoneVerificationFailed verificationFailed = (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        print('The provided phone number is not valid.');
      }else{
        print("verifyFaild:${e..message}");
      }
    };

    final PhoneCodeSent smsCodeSent = (String verificationId, int? resendToken) async{
      // Update the UI - wait for the user to enter the SMS code
      this.verificationId = verificationId;
      this.reSend=resendToken!;

      //Go to input OTP Page
      //Example Navigator.push(context,OTPPage());
      Navigator.push(
        context!, MaterialPageRoute(
          builder: (context) => OTP_Register_Password()),
      );
    };

    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verificationId) {
      this.verificationId = verificationId;
      this.codeSent = true;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout:const Duration(seconds: 120),
      forceResendingToken: codeSent ? reSend : null,
      phoneNumber: '+85620'+phoneNumber.text,
      verificationCompleted:  verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrievalTimeout,
    );
  }

  Future<String> confirmWithOTP() async{
    try{
      AuthCredential authCredential = PhoneAuthProvider.credential(verificationId: this.verificationId, smsCode: otpController.text);
      final UserCredential credential = await FirebaseAuth.instance.signInWithCredential(authCredential);
      final idToken = await credential.user?.getIdToken();

      print("firebaseToken:$idToken");
      this.firebaseToken = idToken;

      await registerUser(idToken!);

      return Future.value(idToken);
    }catch(e){
      print("Confirm OTP Error:$e");
    }
    return Future.value('');
  }

  Future<void> registerUser(String idToken) async {

    final url = Uri.parse('$endPoint/register');

    String originalDateString = date.text;

    // Parse the original date string into a DateTime object
    DateTime originalDate = DateFormat('MM/dd/yyyy').parse(originalDateString);

    // Format the DateTime object into the desired output format
    String formattedDateString = DateFormat('yyyy-MM-dd').format(originalDate);
    final body = {
      'name': name.text,
      'surname': laseName.text,
      'dob': formattedDateString,
      'phone': phoneNumber.text,
      'password': passWord.text,
      'firebase_token': idToken
    };

    final response = await http.post(url, body: json.encode(body), headers: {
      'Content-Type': 'application/json',
    });

    print("Register response: ");
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      // Registration successful
    } else {
      // Registration failed
    }
  }
}