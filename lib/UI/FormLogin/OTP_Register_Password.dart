

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/VerifyPhoneAuth/VertifyResgister.dart';

import 'formLogin.dart';
class OTP_Register_Password extends StatefulWidget {
  static const routeName = "/OTP_Register_Password";

  @override
  State<OTP_Register_Password> createState() => _OTP_Register_PasswordState();
}

class _OTP_Register_PasswordState extends State<OTP_Register_Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          elevation: 0,
        ),
        backgroundColor: Colors.grey.shade300,
        body:SingleChildScrollView(
          child: Form(
            child: Consumer<VertifyRegister>(
                builder: (context,Register,child) {
                  return Container(

                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left:10),
                          width: 140,
                          height: 140,
                          child: Image.asset('assets/images/dbook.png'),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text("ດີບຸກ",style: TextStyle(
                                fontSize: 34,fontWeight: FontWeight.bold,color: Colors.black87),)),
                        SizedBox(height: 60,),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text("ການຢືນຢັນ OTP",style: TextStyle(
                                fontSize: 20,color: Colors.black87),)),

                        TextField(
                          decoration: InputDecoration(
                            labelText: "OTP CODE",
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(),
                          ),
                          controller: Register.otpController,
                        ),
                        SizedBox(height: 100,),
                        Container(
                          margin:EdgeInsets.only(left: 10),
                          width:180,
                          height:60,
                          child: FloatingActionButton(
                              backgroundColor: Colors.lightBlue[900],
                              child: InkWell(
                                onTap:   () async{
                                  String idToken = await Register.confirmWithOTP();

                                  if(idToken.isNotEmpty){
                                    Navigator.push(
                                      context, MaterialPageRoute(
                                        builder: (context) => Form_Login()),
                                    );
                                  }else{
                                    //Alert Message OTP Not Match
                                  }

                                },
                                child: Text(
                                  "ບັນທຶກ",
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: () {}),
                        ),


                      ],
                    ),
                  );
                }
            ),
          ),
        )
    );
  }
}




