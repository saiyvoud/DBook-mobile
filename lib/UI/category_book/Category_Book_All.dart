


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Category_book_bay.dart';

class Category_Detail extends StatefulWidget {
  static const routeName = "/Category_Detail";
  @override
  State<Category_Detail> createState() => _Category_DetailState();
}

class _Category_DetailState extends State<Category_Detail> {
  final List<Map> myProducts =
  List.generate(100000, (index) => {"id": index, "name": "ຄິດບວກຊີວິດບວກ $index"})
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: Text("ປະເພດຂອງປື້ມ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
      ),
      body: GestureDetector(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>Category_Book_Buy()));
        },
        child: Container(
          padding: EdgeInsets.all(12),
          color: Colors.grey.shade300,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemCount: myProducts.length,
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                            height: 170,
                            child: ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
                                child: Image.network("https://i.pinimg.com/736x/95/a7/d6/95a7d69fe0f6e217806de34034f194d7.jpg",fit: BoxFit.cover,))
                        ),
                        SizedBox(height: 12,),
                        //Text(myProducts[index]["name"]),
                        Text("ຄິດບວກຊີວິດບວກ",style: TextStyle(fontSize: 15 ),),
                        Text("ກີບ 85,000,00",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.redAccent),)
                      ],
                    )
                );
              }),
        ),
      ),
    );
  }
}
