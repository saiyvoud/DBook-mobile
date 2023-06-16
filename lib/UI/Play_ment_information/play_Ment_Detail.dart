
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bill_Pay_dart.dart';
import 'Image_Playment.dart';
import 'Information_Customer.dart';

class Play_Ment_Detail extends StatefulWidget {
  static const routeName = "/Play_Ment_Detail";

  @override
  State<Play_Ment_Detail> createState() => _Play_Ment_DetailState();
}

class _Play_Ment_DetailState extends State<Play_Ment_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.lightBlue[900],

      ) ,
      backgroundColor: Colors.red.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 5,
                left: 20,
              ),
              child: Row(
                children: [
                  Column(

                    children: [
                      //   SizedBox(height: 12,),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0), ),
                            child: Image.network(
                              "https://img.freepik.com/premium-psd/hardcover-book-mockup-design-isolated_146060-241.jpg?w=2000",fit: BoxFit.cover,),
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("ກົດຂໍ້ໜຶ່ງຂອງຄວາມສຳພັນ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                              Container(
                                child: Text("ຈຳນວນ:",style: TextStyle(fontSize: 17),),
                              ),
                              Container(
                                child: Text("LAK 998,000",style: TextStyle(color: Colors.red,fontSize: 17),),
                              ),
                            ],
                          )
                        ],
                      ),


                    ],
                  ),
                ],
              ),
              height: 225.0,
              width: double.infinity,
              color: Colors.white,

            ),
            SizedBox(height: 20,),
            Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      width: double.infinity,
                      height: 150,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ຂົນສົ່ງ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          SizedBox(height: 12,),
                          TextField(
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(),
                                labelText: "ກະລຸນາເລືອກສາຂາປາຍທາງ",
                                fillColor: Colors.grey.shade100,
                                suffixIcon: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=>Information_Customer ()));
                                    },
                                    child: Icon(Icons.change_history_outlined,color: Colors.black87,)),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(60),
                                )),
                          ),
                          SizedBox(height: 6,),
                          Text("ຊຳລະຄ່າຂົນສົ່ງປາຍທາງ",style: TextStyle(fontSize: 17),)],
                      )),
                  SizedBox(height: 12,),
                  Container(
                    height: 90,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text("ຊ່ອງທາງການສຳລະເງີນ",style: TextStyle(fontSize: 20),)),
                          Row(children: [
                            // Container(padding: EdgeInsets.only(left: 100,top:10),
                            //     child: Text("ຈ່າຍຜ່ານປາຍທາງ",style: TextStyle(fontSize: 20),))
                            Radio(
                                value: "radio value",
                                groupValue: "group value",
                                onChanged: (value){
                                  print(value); //selected value
                                }
                            ),
                            Text("ຈ່າຍຜ່ານປາຍທາງ",style: TextStyle(fontSize: 19),),
                          ],
                          )
                        ]
                    ),
                  )
                ]
            ),
            SizedBox(height: 140,),
            Row(
              children: [
                Text("ລວມທັງໝົດ",style: TextStyle(fontSize: 18),),
                SizedBox(width: 12,),
                Text("1,838,000 LAK",style: TextStyle(fontSize: 20,color: Colors.red),),
                SizedBox(width: 16,),
                FlatButton(
                  onPressed: (){
                  },
                  color: Colors.blue,
                  child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>Image_Playment()));
                      },
                      child: Text("ຊຳລະເລີຍ",style: TextStyle(fontSize: 22),)),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


