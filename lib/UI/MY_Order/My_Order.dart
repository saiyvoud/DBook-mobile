import 'package:dbook_project/Provider/order/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class My_Order extends StatefulWidget {
  @override
  State<My_Order> createState() => _My_OrderState();
}

class _My_OrderState extends State<My_Order> {
  @override
  void initState() {
    super.initState();
    Provider.of<OrderProvider>(context, listen: false)..getOrders();
  }

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
        body: Consumer<OrderProvider>(builder: (context, order, child) {
          if (order.isLoading == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: order.ordersModel!.length,
            itemBuilder: (context, index) {
              final data = order.ordersModel![index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                       // "https://cdn.elearningindustry.com/wp-content/uploads/2016/05/top-10-books-every-college-student-read-1024x640.jpeg",
                        "${data.image_url}",
                        fit: BoxFit.cover,
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "${data.book_name}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    Column(
                      children: [
                        Container(
                            child: Text(
                          "ຈຳນວນ: ${data.qty}",
                          style: TextStyle(),
                        )),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            child: Text(
                          "ລາຄາ ${data.sale_price}:",
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        )),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            child: Text(
                          "ລວມ ${data.total} ₭:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.red),
                        )),
                      ],
                    ),
                    
                    Column(
                      children: [
                        Container(
                            child: Text(
                          "${data.status}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.green),
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            );
          });
        }));
  }
}
