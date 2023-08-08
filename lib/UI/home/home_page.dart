import 'package:dbook_project/Provider/category/category_provider.dart';
import 'package:dbook_project/UI/home/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../category_book/Category_Book.dart';
import '../category_book/Category_book_buy.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/homepage_screen";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false)
      ..getTopSale()
      ..getNewBook();
  }

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
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: 
              TextField(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchWidget()));
                },
                decoration: InputDecoration(
                    filled: true,
                    //enabled: false,
                    border: OutlineInputBorder(),
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
           
            ),
            SizedBox(
              height: 17,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "ປະເພດປື້ມຂາຍດີ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey.shade800),
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Categories()));
                          },
                          child: Text(
                            "ເບິ່ງທັງໝົດ",
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ))
                    ],
                  ),
                  SizedBox(height: 10),
                  Consumer<CategoriesProvider>(
                      builder: (context, topsale, child) {
                    if (topsale.isLoading == true) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      height: 190,
                      child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: topsale.books!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Category_Book_Buy(
                                              id: topsale.books![index].id!,
                                            )));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 10),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Center(
                                          child: Container(
                                            child: Image.network(
                                                "${topsale.books![index].image_url}"),
                                            width: 70,
                                            height: 90,
                                          ),
                                        ),
                                        Text(
                                          "${topsale.books![index].name}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          "ກີບ${topsale.books![index].order_price}",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    width: 120,
                                    height: double.infinity,
                                    // color: Colors.blue,
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        gradient: LinearGradient(colors: [
                                          Colors.white,
                                          Colors.white
                                        ]),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2.0,
                                              offset: Offset(2.0, 2.0))
                                        ]),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                            );
                          }),
                    );
                  }),
                ],
              ),
              height: 260.0,
              width: double.infinity,
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
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "ປະເພດປື້ມເຂົ້າໃຫມ່",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey.shade800),
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Categories()));
                          },
                          child: Text(
                            "ເບິ່ງທັງໝົດ",
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ))
                    ],
                  ),
                  SizedBox(height: 10),
                  Consumer<CategoriesProvider>(
                      builder: (context, topsale, child) {
                    if (topsale.isLoading == true) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      height: 190,
                      child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: topsale.newBooks!.length,
                          itemBuilder: (context, index) {
                            final data = topsale.newBooks![index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Category_Book_Buy(
                                              id: data.id!,
                                            )));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 10),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Center(
                                          child: Container(
                                            child: Image.network(
                                                "${data.image_url}"),
                                            width: 70,
                                            height: 90,
                                          ),
                                        ),
                                        Text(
                                          "${data.name}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          "ກີບ${data.order_price}",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    width: 120,
                                    height: double.infinity,
                                    // color: Colors.blue,
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        gradient: LinearGradient(colors: [
                                          Colors.white,
                                          Colors.white
                                        ]),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2.0,
                                              offset: Offset(2.0, 2.0))
                                        ]),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                            );
                        
                          }),
                    );
                  }),
                ],
              ),
              height: 260.0,
              width: double.infinity,
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
          ]),
        ),
      ),
    );
  }
}
