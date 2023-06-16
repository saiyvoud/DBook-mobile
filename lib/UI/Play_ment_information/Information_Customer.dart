

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Information_Customer extends StatefulWidget {
  static const routeName = "/Information_Customer";
  @override
  State<Information_Customer> createState() => _Information_CustomerState();
}

class _Information_CustomerState extends State<Information_Customer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.orange.shade50,
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(
              margin: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text("ເບີໂທ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  TextField(
                    decoration: InputDecoration(
                        filled: true, //<-- SEE HERE
                        fillColor: Colors.white,
                        labelText: "ເບີໂທ",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                        )
                    ),
                  ),
                  SizedBox(height: 7,),
                  Container(
                    padding: EdgeInsets.only(right: 300),
                    child: Text("ຊື່ຜູ້ຮັບ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  ),
                  //SizedBox(height: 12,),
                  TextField(
                    decoration: InputDecoration(
                        filled: true, //<-- SEE HERE
                        fillColor: Colors.white,
                        labelText: "ຊື່ຜູ້ຮັບ ",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder()
                    ),
                  ),
                  //SizedBox(height: 12,),
                  Text("ບ້ານ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  TextField(
                    decoration: InputDecoration(
                        filled: true, //<-- SEE HERE
                        fillColor: Colors.white,
                        labelText: "ບ້ານ ",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(

                        )
                    ),
                  ),
                  Text("ເມືອງ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  TextField(
                    decoration: InputDecoration(
                        filled: true, //<-- SEE HERE
                        fillColor: Colors.white,
                        labelText: "ເມືອງ  ",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder()
                    ),
                  ),
                  Text("ແຂວງ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  TextField(
                    decoration: InputDecoration(
                        filled: true, //<-- SEE HERE
                        fillColor: Colors.white,
                        labelText: "ແຂວງ  ",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder()
                    ),
                  ),

                  SizedBox(height: 60,),
                  Container(
                    // margin:EdgeInsets.only(left: 120),
                    width:350,
                    height:60,
                    child: FloatingActionButton(
                        backgroundColor: Colors.lightBlue[900],
                        child: Text(
                          "ບັນທຶກ",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {}),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
