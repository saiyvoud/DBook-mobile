import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../UI/FormLogin/New_Password.dart';
import '../../UI/FormLogin/OTP_Password.dart';


class ResetPasswordServiceProvider extends ChangeNotifier {

  TextEditingController phoneNumber= TextEditingController();

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
        this.firebaseToken = idToken;


        //Call Function Register Or Reset Password Or ....
        //resetPassword();
        //.
        //.
        //.
       Navigator.push(
         context!, MaterialPageRoute(
           builder: (context) => New_Password()),
       );
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
          builder: (context) => OTP_Password()),
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
      //Call Register()

      print("firebase Token:$idToken");
      this.firebaseToken = idToken;
      return Future.value(idToken);
    }catch(e){
      print("Confirm OTP Error:$e");
    }
    return Future.value('');
  }


}