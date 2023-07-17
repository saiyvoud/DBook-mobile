

import 'package:flutter/material.dart';

import 'formLogin.dart';

class New_Password extends StatefulWidget {
  static const routeName = "/New_Password";

  @override
  State<New_Password> createState() => _New_PasswordState();
}

class _New_PasswordState extends State<New_Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade300,
        ),
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Form(
            child: Container(

              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  SizedBox(height: 40,),
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
                      child: Text("ກະລຸນາໃສ່ລະຫັດຜ່ານໃໝ່",style: TextStyle(
                          fontSize: 20,color: Colors.black87,fontWeight: FontWeight.bold),)),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "ໃສ່ລະຫັດຜ່ານໃໝ່",
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
                            Navigator.push(
                              context, MaterialPageRoute(
                                builder: (context) => Form_Login()),
                            );
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
            ),
          ),
        )
    );
  }
}
