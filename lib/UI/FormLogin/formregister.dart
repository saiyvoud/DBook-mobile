


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/VerifyPhoneAuth/VertifyResgister.dart';
class Form_Regester extends StatefulWidget {
  static const routeName = "/formregister_screen";
  @override
  State<Form_Regester> createState() => _Form_RegesterState();
}
class _Form_RegesterState extends State<Form_Regester> {


  VertifyRegister? _register;

  @override
  void initState(){
    _register =Provider.of<VertifyRegister>(context,listen: false);
    _register!.context = context;
    super.initState();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade300,
      body: GestureDetector(
        onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),


         child: Consumer<VertifyRegister >(
             builder: (context,Register,child) {


      return  Container(
        height: 900,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
                children: [
            Container(
            margin: EdgeInsets.only(right: 20),
            width: 100,
            height: 100,
            child:Image.asset('assets/images/dbook.png') ,
          ),
          Container(
              margin: EdgeInsets.only(left: 10),
              child: Text("ດີບຸກ",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.black87),)),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(

                decoration: InputDecoration(
                labelText: "ຊື່",
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                )),
              controller: Register.name,
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: Register.laseName,
            decoration: InputDecoration(
                fillColor: Colors.white,
                labelText: "ນາມສະກຸນ",
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                )),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: Register.date,
            decoration: InputDecoration(
                labelText: "ວັນທີ/ເດືອນ/ປີເກີດ",
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                )),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: Register.phoneNumber,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "020 ເບີໂທ",
                labelStyle: TextStyle(color: Colors.black87),
                hintStyle: TextStyle(color: Colors.black87),
                enabledBorder: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(14),

                ),
                focusedBorder: OutlineInputBorder()
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: Register.passWord,
            decoration: InputDecoration(
                labelText: "ລະຫັດຜ່ານ",
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                )),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          width: 180,
          height: 60,
          child: FloatingActionButton(
              backgroundColor: Colors.lightBlue[900],
              child: InkWell(
                onTap:() {
                  Register.verifyPhone();
                },
                child: Text(
                  "ຕໍ່ໄປ",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {





              }
              ),
        ),
        ],
      ),
      ),
      ),
      );
    }
        ),
      ),
    );
  }
}
