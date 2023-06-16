import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class My_Order extends StatefulWidget {
  @override
  State<My_Order> createState() => _My_OrderState();
}

class _My_OrderState extends State<My_Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ອໍເດິຂອງຂ້ອຍ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        "https://cdn.elearningindustry.com/wp-content/uploads/2016/05/top-10-books-every-college-student-read-1024x640.jpeg",
                        fit: BoxFit.cover,
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          "ກົດຂໍ້ນຶ່ງຂອງຄວາມສຳພັນ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    Column(
                      children: [
                        Container(
                            child: Text(
                              "ຈຳນວນ:",
                              style: TextStyle(),
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            child: Text(
                              "LAK 79 000:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.red),
                            )),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          FlatButton(
                            minWidth: 20,
                            height: 35,
                            onPressed: () {},
                            color: Colors.grey.shade400,
                            child: Text(
                              "ຍົກເລີກ",
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          FlatButton(
                            minWidth: 20,
                            height: 35,
                            onPressed: () {},
                            color: Colors.blue,
                            child: Text(
                              "ຊຳລະເລີຍ",
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        "https://cdn.elearningindustry.com/wp-content/uploads/2016/05/top-10-books-every-college-student-read-1024x640.jpeg",
                        fit: BoxFit.cover,
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          "ກົດຂໍ້ນຶ່ງຂອງຄວາມສຳພັນ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    Column(
                      children: [
                        Container(
                            child: Text(
                              "ຈຳນວນ:",
                              style: TextStyle(),
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            child: Text(
                              "LAK 79 000:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.red),
                            )),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          FlatButton(
                            minWidth: 20,
                            height: 35,
                            onPressed: () {},
                            color: Colors.grey.shade400,
                            child: Text(
                              "ຍົກເລີກ",
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          FlatButton(
                            minWidth: 20,
                            height: 35,
                            onPressed: () {},
                            color: Colors.blue,
                            child: Text(
                              "ຊຳລະເລີຍ",
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
