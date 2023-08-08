import 'package:dbook_project/Provider/category/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../category_book/Category_book_buy.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false)..getTopSale();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesProvider>(builder: (context, category, child) {
      return Scaffold(
          appBar: AppBar(
            title: Container(
              height: 50,
              child: TextFormField(
                controller: category.searchTxt,
                onFieldSubmitted: (value) {
                  setState(() {
                    category.search();
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "ຄົ້ນຫາ",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          body: category.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: category.books!.length,
                  itemBuilder: (context, index) {
                    final data = category.books![index];
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Center(
                                  child: Container(
                                    child: Image.network("${data.image_url}"),
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
                          SizedBox(width: 10),
                        ],
                      ),
                    );
                  }));
    });
  }
}
