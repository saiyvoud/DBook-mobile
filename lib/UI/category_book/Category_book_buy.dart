import 'package:dbook_project/Provider/category/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Play_ment_information/play_Ment_Detail.dart';

class Category_Book_Buy extends StatefulWidget {
  static const routeName = "/Categories_Book_Buy";
  final int id;

  const Category_Book_Buy({super.key, required this.id});
  @override
  State<Category_Book_Buy> createState() => _Category_Book_BuyState();
}

class _Category_Book_BuyState extends State<Category_Book_Buy> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false)
      ..getOneBook(id: widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    Widget counterButton(String icon) {
      return OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: Colors.red.shade100, //<-- SEE HERE
          ),
          onPressed: () {},
          child: Container(
            width: 45,
            height: 45,
            padding: EdgeInsets.only(bottom: 4, left: 1),
            alignment: Alignment.center,
            child: Text(
              icon,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black),
            ),
          ));
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
        ),
        //  backgroundColor: Color(0xFFD265FF),
        body: Consumer<CategoriesProvider>(
          builder: (context, categories, child) {
            if (categories.bookLoading == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Image.network(
                      categories.book!.image_url!
                      ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        "ລາຄາ: ${categories.book!.sale_price.toString()} LAK",
                        style: TextStyle(fontSize: 30, color: Colors.redAccent),
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        "ຊື່ປື້ມ: ${categories.book!.name}",
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      )),
                  // Container(
                  //     padding: EdgeInsets.only(left: 12),
                  //     child: Text(
                  //       "ລາຍລະອຽດ",
                  //       style: TextStyle(fontSize: 20, color: Colors.black),
                  //     )),
                  Container(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        "ຊື່ຜູ້ຂຽນ: ${categories.book!.author}",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        "ປະເພດປື້ມ: ປື້ມທັມມະ",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          "ຈຳນວນ",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        counterButton('-'),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "${categories.book!.quantity.toString()}",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        counterButton('+')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 12, left: 12),
                    width: 500,
                    height: 50,
                    color: Colors.grey.shade300,
                    child: Text(
                      "ຂົນສົ່ງ 2-3 ມື້",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Play_Ment_Detail(booksModel: categories.book!,)));
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blue,
                                  width: 5.0,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue,
                            ),
                            child: const Center(
                                child: Text(
                              'ຊື້ເລີຍ',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blue,
                                width: 5.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue,
                          ),
                          child: const Center(
                              child: Text(
                            'ໃສ່ກະຕ່າ',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}


































// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../bay_detail/Buy_detail.dart';
//
// class Category_book_bay extends StatefulWidget {
//   static const routeName = "/Category_book_bay";
//
//   @override
//   State<Category_book_bay> createState() => Category_Book_Bay();
// }
//
// class Category_Book_Bay extends State<Category_book_bay> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.lightBlue[900],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 500,
//             height: 250,
//             child: Image.network("https://s22428.pcdn.co/wp-content/uploads/2023/01/WODW_Robodog_1080_v4_blue-1-1.png",fit: BoxFit.cover,)
//           ),
//           Container(
//               padding: EdgeInsets.only(left: 12),
//               child: Text("ລາຄາ:",style: TextStyle(fontSize: 30,color: Colors.redAccent),)),
//           Container(
//             padding: EdgeInsets.only(left: 12),
//               child: Text("Mine Set",style: TextStyle(fontSize: 30,color: Colors.black),)),
//           Container(
//               padding: EdgeInsets.only(left: 12),
//               child: Text("ລາຍລະອຽດ",style: TextStyle(fontSize: 30,color: Colors.black),)),
//           Container(
//               padding: EdgeInsets.only(left: 12),
//               child: Text("ຊື່ຜູ້ຂຽນ",style: TextStyle(fontSize: 20,color: Colors.black),)),
//           Container(
//               padding: EdgeInsets.only(left: 12),
//               child: Text("ປື້ມທັມມະ",style: TextStyle(fontSize: 20,color: Colors.black),)),
//           Container(
//             padding: EdgeInsets.only(top: 12,left: 12),
//             width: 500,
//             height: 50,
//             color: Colors.grey.shade400,
//             child: Text("ຂົນສົ່ງ 2-3 ມື້",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//           ),
//          SizedBox(height: 100,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 margin:EdgeInsets.only(left: 20),
//                 width:100,
//                 height:50,
//                 child: FloatingActionButton(
//                     backgroundColor: Colors.blue,
//                     child: GestureDetector(
//                       // onTap: (){
//                       //   Navigator.push(context,
//                       //       MaterialPageRoute(builder: (context)=>Buy_Detail()));
//                       // },
//                       child: Text(
//                         "ຊື້ເລີຍ",
//                         style: TextStyle(
//                             fontSize: 23,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     onPressed: () {}),
//               ),
//               SizedBox(width: 125,),
//               Container(
//                // margin:EdgeInsets.only(left: 120),
//                 width:120,
//                 height:50,
//                 child: FloatingActionButton(
//                     backgroundColor: Colors.blue,
//                     child: Text(
//                       "ໃສ່ກະຕ່າ",
//                       style: TextStyle(
//                           fontSize: 23,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     onPressed: () {}),
//               ),
//             ],
//           ),
//
//         ],
//       ),
//     );
//   }
// }
