


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bill_Pay extends StatefulWidget {
  static const routeName = "/Bill_Pay";
  @override
  State<Bill_Pay> createState() => _Bill_PayState();
}
class _Bill_PayState extends State<Bill_Pay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ໃບບິນຈ່າຍເງີນ"),
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left: 40,top: 40),
              child: Text("ດີບຸກ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
          SizedBox(height: 50,),
          Container(
              padding: EdgeInsets.only(left: 120,),
              child: Text("ໃບບີນຈ່າຍເງີນ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
          SizedBox(height: 30,),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 12,),
                  child: Text("ວັນທີເດືອນປ",style: TextStyle(fontSize: 20),)),
              SizedBox(width: 110,),
              Container(
                // padding: EdgeInsets.only(left: 120,),
                  child: Text("9-5-2023 12:48",style: TextStyle(fontSize: 20),)),
            ],
          ),
          SizedBox(height: 5,),
          Container(
              padding: EdgeInsets.only(left: 5,),
              child: Text("***************************",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
          ),
          SizedBox(height: 30,),
          Container(
              padding: EdgeInsets.only(left: 6,),
              child: Text("ລາຍການສິງຄ້າ          ຈຳນວນ            ລາຄາ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          SizedBox(height: 12,),
          Container(
              padding: EdgeInsets.only(left: 6,),
              child: Text("ກົດຂໍ້ໜຶ່ງຂອງຄວາມສົມພັນ                1                    100 000 LAK",style: TextStyle(fontSize: 14),)),
          Container(
              padding: EdgeInsets.only(left: 6,),
              child: Text("ກົດຂໍ້ໜຶ່ງຂອງຄວາມສົມພັນ                1                    100 000 LAK",style: TextStyle(fontSize: 14),)),
          SizedBox(height: 200,),
          Container(
              padding: EdgeInsets.only(left: 6,),
              child: Text("******* THANK YOU*******",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
          Text("...........................................",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
        ],
      ),
    );
  }
}
