

import 'package:flutter/material.dart';

import 'Category_Book_All.dart';
class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);
  static const routeName = "/Categories_Book";
  @override
  State<Categories> createState() => _CategoriesState();
}
class _CategoriesState extends State<Categories> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: Text("ປະເພດຂອງປື້ມ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: Center(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Category_Detail()));
              },
              child: GridView.extent(
                primary: false,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                maxCrossAxisExtent: 190.0,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                              width: 160,
                              height: 110,
                              child: Image.network("_category[index].Image",fit: BoxFit.cover,)),
                        ),
                        SizedBox(height: 10,),
                        Text("_category[index].title",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),)
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
                            ]
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black87 ,
                              blurRadius: 2.0,
                              offset: Offset(2.0,2.0)
                          )
                        ]
                    ),
                    //color: Colors.deepOrange.shade50
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                              width: 160,
                              height: 110,
                              child: Image.network("https://img.freepik.com/premium-psd/editable-high-quality-realistic-small-thick-hardcover-book-mockup-with-gold-lettering-title_433979-1886.jpg?w=2000",fit: BoxFit.cover,)
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("ທຸລະກິດ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        // border: Border.all(
                        //   color: Colors.grey,
                        //   width: 2.0,
                        // ),
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
                            ]
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black87 ,
                              blurRadius: 2.0,
                              offset: Offset(2.0,2.0)
                          )
                        ]
                    ),
                    //  color: Colors.deepOrange.shade50
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                              width: 160,
                              height: 110,
                              child: Image.network("https://i.etsystatic.com/34639405/r/il/82e0f6/4591296020/il_fullxfull.4591296020_70dj.jpg",fit: BoxFit.cover,)),
                        ),
                        SizedBox(height: 10,),
                        Text("ພັດທະນາຕົນເອງ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        // border: Border.all(
                        //   color: Colors.grey,
                        //   width: 2.0,
                        // ),
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
                            ]
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black87 ,
                              blurRadius: 2.0,
                              offset: Offset(2.0,2.0)
                          )
                        ]
                    ),
                    //color: Colors.deepOrange.shade50
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                              width: 160,
                              height: 110,
                              child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoLj62CDwRTGMHSIhxkZsTMh0FAYj0gs-spQ&usqp=CAU",fit: BoxFit.cover,)),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "ຈິດຕະວິທະຍາ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        // border: Border.all(
                        //   color: Colors.grey,
                        //   width: 2.0,
                        // ),
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
                            ]
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black87 ,
                              blurRadius: 2.0,
                              offset: Offset(2.0,2.0)
                          )
                        ]
                    ),
                    //color: Colors.deepOrange.shade50
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                              width: 160,
                              height: 110,
                              child: Image.network("https://i2.wp.com/mockuptree.com/wp-content/uploads/edd/2021/04/free-book-cover-mockup.jpg",fit: BoxFit.cover,)),
                        ),
                        SizedBox(height:10,),
                        Text("  ວັນນະກຳ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        // border: Border.all(
                        //   color: Colors.grey,
                        //   width: 2.0,
                        // ),
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
                            ]
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black87 ,
                              blurRadius: 2.0,
                              offset: Offset(2.0,2.0)
                          )
                        ]
                    ),
                    // color: Colors.deepOrange.shade50
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                              width: 160,
                              height: 110,
                              child: Image.network("https://img.freepik.com/premium-psd/software-box-mockup_149660-1024.jpg",fit: BoxFit.cover,)),
                        ),
                        SizedBox(height: 10,),
                        Text("ປະຫວັດສາດ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        // border: Border.all(
                        //   color: Colors.grey,
                        //   width: 2.0,
                        // ),
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
                            ]
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black87 ,
                              blurRadius: 2.0,
                              offset: Offset(2.0,2.0)
                          )
                        ]
                    ),
                    // color: Colors.deepOrange.shade50
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
