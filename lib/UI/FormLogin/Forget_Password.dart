
import 'package:dbook_project/Provider/VerifyPhoneAuth/PhoneAuthServiceProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Forget_Password extends StatefulWidget {
  static const routeName = "/Forget_Password";
  @override
  State<Forget_Password> createState() => _Forget_PasswordState();
}

class _Forget_PasswordState extends State<Forget_Password> {

  ResetPasswordServiceProvider? _phoneAuth;

  @override
  void initState(){
    _phoneAuth = Provider.of<ResetPasswordServiceProvider>(context,listen: false);
    _phoneAuth!.context = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          elevation: 0,
        ),
        backgroundColor: Colors.grey.shade300,

        body: SingleChildScrollView(
          child: Form(
            child: Consumer<ResetPasswordServiceProvider>(
              builder: (context,phoneAuth,child) {
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
                      SizedBox(height: 30,),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text("ຖ້າທ່ານລືມລະຫັດຜ່ານຂອງທ່ານກະລຸນາປ້ອນເບີໂທລະສັບຂອງທ່ານເພື່ອເລີ່ມຂັ້ນຕອນການອອກ     ລະຫັດຜ່ານໃໝ່ດ້ວຍຕົວທ່ານເອງ",style: TextStyle(
                              fontSize: 17,color: Colors.black87),)),
                      SizedBox(height: 60,),
                      TextField(
                        controller:phoneAuth.phoneNumber,
                        decoration: InputDecoration(
                          labelText: "020 ເບີໂທ",
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 100,),
                      Container(
                        margin:EdgeInsets.only(left: 10),
                        width:180,
                        height:60,
                        child: FloatingActionButton(
                            backgroundColor: Colors.lightBlue[900],
                            child: InkWell(
                              onTap:   () {
                               phoneAuth.verifyPhone();
                              },

                              child: Text(
                                "ຕໍ່ໄປ",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {

                            }),
                      ),
                      SizedBox(height: 30,),

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













