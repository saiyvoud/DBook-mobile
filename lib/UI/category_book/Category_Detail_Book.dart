import 'package:dbook_project/Provider/category/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Category_book_buy.dart';

class Category_Detail extends StatefulWidget {
  final String id;
  final String name;
  static const routeName = "/Category_Detail";

  const Category_Detail({super.key,required this.id,required this.name});
  @override
  State<Category_Detail> createState() => _Category_DetailState();
}

class _Category_DetailState extends State<Category_Detail> {
  final List<Map> myProducts = List.generate(
          100000, (index) => {"id": index, "name": "ຄິດບວກຊີວິດບວກ $index"})
      .toList();

  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false)
      // ..fecthBook()
      ..getBookByCategory(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          title: Text(
            widget.name,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
        
        body: Consumer<CategoriesProvider>(
          builder: (context, categoriesProvider, child) {
            if (categoriesProvider.bookLoading == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (categoriesProvider.books!.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              padding: EdgeInsets.all(12),
              color: Colors.grey.shade300,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: categoriesProvider.books!.length,
                  itemBuilder: (BuildContext ctx, index) {
                    final data = categoriesProvider.books;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Category_Book_Buy(
                                      id: data![index].id!,
                                    )));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Container(
                                height: 170,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                    child: Image.network(
                                      data![index].image_url.toString(),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                data[index].name!,
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "${data[index].sale_price.toString()} LAK",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              )
                            ],
                          )),
                    );
                  }),
            );
          },
        ));
  }
}
