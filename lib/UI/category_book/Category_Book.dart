import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/category/category_provider.dart';
import 'Category_Detail_Book.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);
  static const routeName = "/Categories_Book";
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  
  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false)..fechCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          title:  Text(
            "ປະເພດຂອງປື້ມ",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Consumer<CategoriesProvider>(
          builder: (context, categories, child) {
            if (categories.isLoading == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (categories.category == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.builder(
              padding: EdgeInsets.all(5),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3/ 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                ),
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                itemCount: categories.category!.length,
                itemBuilder: (context, index) {
                  final data = categories.category;
                  return Container(
                    padding: EdgeInsets.all(12),
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
                                              color: Colors.black,
                                              blurRadius: 2.0,
                                              offset: Offset(2.0, 2.0)
                                              )
                                        ]),
                    child: Container(
                      
                      padding: EdgeInsets.all(5),
                      color: Colors.white,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Category_Detail(
                                      id: data![index].id.toString(),
                                      name: data[index].name.toString(),
                                    )));
                          },
                          child: Column(
                            children: [
                              Container(
                               // padding: EdgeInsets.all(7),
                                child: Container(
                                    width: 155,
                                    height: 185,
                                    child: Image.network(
                                      data![index].image_url!,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              Text(
                                data[index].name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
        ));
  }
}