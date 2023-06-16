
import 'package:flutter/material.dart';

import 'category_book/Category_Book.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/homepage_screen";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ຮ້ານຂາຍປື້ມດີບຸກ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.lightBlue[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.grey.shade300,
          //  padding: EdgeInsets.only(left: 18, right: 24),
          margin: EdgeInsets.all(12),
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "ຄົ້ນຫາ",
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            SizedBox(
              height: 17,
            ),
            Container(
              padding: EdgeInsets.only(
                top: 5,
                left: 2,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "ປະເພດປື້ມ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey.shade800),
                          ),
                          SizedBox(
                            width: 127,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>Categories()));
                            },
                            child: Text(
                              "ເບີ່ງທັງໝົດ", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color:Colors.blue),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  child: Image.network(
                                      "https://theresasmithwrites.files.wordpress.com/2022/01/9781472290779.jpg"),
                                  width: 70,
                                  height: 110,
                                ),
                                Text(
                                  "PARIS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                                Text(
                                  "ກີບ49,000 ",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                ),
                              ],
                            ),
                            width: 90,
                            height: 165,
                            // color: Colors.blue,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                    colors: [Colors.white, Colors.white]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0,
                                      offset: Offset(2.0, 2.0))
                                ]),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyEWg4u45_B-Bsv8BjYqFMhOW0PriQv18yDCS9u0IRa_9s-12s_J4hJ1Nq0fVuDopUmDo&usqp=CAU"),
                                  width: 70,
                                  height: 110,
                                ),
                                Text(
                                  "PARIS", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                                ),
                                Text("ກີບ49,000 ", style: TextStyle(color: Colors.red, fontSize: 16),),
                              ],
                            ),
                            width: 90,
                            height: 165,
                            // color: Colors.blue,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                    colors: [Colors.white, Colors.white]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0,
                                      offset: Offset(2.0, 2.0))
                                ]),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  child: Image.network(
                                      "https://media.istockphoto.com/id/1322530406/photo/stack-of-hardcover-text-books-on-white-background-isolated-3d-illustration.jpg?b=1&s=170667a&w=0&k=20&c=uvO9evbDqpvybXnA8cWZo4XAJPfF2QOTSjuuw0JNVYM="),
                                  width: 70,
                                  height: 110,
                                ),
                                Text(
                                  "PARIS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                                Text(
                                  "ກີບ49,000 ",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                ),
                              ],
                            ),
                            width: 90,
                            height: 165,
                            // color: Colors.blue,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                    colors: [Colors.white, Colors.white]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0,
                                      offset: Offset(2.0, 2.0))
                                ]),
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
              height: 225.0,
              width: 320.0,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,

                  borderRadius: BorderRadius.circular(10.0),
                  gradient:
                  LinearGradient(colors: [Colors.white, Colors.white]),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87,
                        blurRadius: 2.0,
                        offset: Offset(2.0, 2.0))
                  ]),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(
                top: 5,
                left: 12,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "ປະເພດປື້ມ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey.shade800),
                          ),
                          SizedBox(
                            width: 200,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  child: Image.network(
                                      "https://theresasmithwrites.files.wordpress.com/2022/01/9781472290779.jpg"),
                                  width: 70,
                                  height: 110,
                                ),
                                Text(
                                  "PARIS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                                Text(
                                  "ກີບ49,000 ",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                ),
                              ],
                            ),
                            width: 90,
                            height: 165,
                            // color: Colors.blue,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                    colors: [Colors.white, Colors.white]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0,
                                      offset: Offset(2.0, 2.0))
                                ]),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  child: Image.network(
                                      "https://theresasmithwrites.files.wordpress.com/2022/01/9781472290779.jpg"),
                                  width: 70,
                                  height: 110,
                                ),
                                Text(
                                  "PARIS", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                                ),
                                Text("ກີບ49,000 ", style: TextStyle(color: Colors.red, fontSize: 16),),
                              ],
                            ),
                            width: 90,
                            height: 165,
                            // color: Colors.blue,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                    colors: [Colors.white, Colors.white]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0,
                                      offset: Offset(2.0, 2.0))
                                ]),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  child: Image.network(
                                      "https://theresasmithwrites.files.wordpress.com/2022/01/9781472290779.jpg"),
                                  width: 70,
                                  height: 110,
                                ),
                                Text(
                                  "PARIS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                                Text(
                                  "ກີບ49,000 ",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                ),
                              ],
                            ),
                            width: 90,
                            height: 165,
                            // color: Colors.blue,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                    colors: [Colors.white, Colors.white]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0,
                                      offset: Offset(2.0, 2.0))
                                ]),
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
              height: 225.0,
              width: 320.0,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  // border: Border.all(
                  //   color: Colors.grey,
                  //   width: 2.0,
                  // ),
                  borderRadius: BorderRadius.circular(10.0),
                  gradient:
                  LinearGradient(colors: [Colors.white, Colors.white]),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87,
                        blurRadius: 2.0,
                        offset: Offset(2.0, 2.0))
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
