import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dbook_project/Provider/order/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Cart_screen());
}

class Cart_screen extends StatefulWidget {
  const Cart_screen({Key? key}) : super(key: key);
  static const routeName = "/Cart_screen";
  @override
  State<Cart_screen> createState() => _Cart_screenState();
}

class _Cart_screenState extends State<Cart_screen> {
  @override
  void initState() {
    super.initState();
    Provider.of<OrderProvider>(context, listen: false)..getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          centerTitle: true,
          title: Text(
            "ກະຕ່າ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Consumer<OrderProvider>(
          builder: (context, cart, child) {
            if (cart.isLoading == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (cart.success == false) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "ບໍ່ມີຂໍ້ມູນ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            }
            return ListView.builder(
              itemCount: cart.cart.length,
              itemBuilder: (context, index) {
                final data = jsonDecode(cart.cart[index]);

                return Card(
                  elevation: 3,
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            //cart.deleteCart();
                            if (cart.success == true) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.SUCCES,
                                animType: AnimType.RIGHSLIDE,
                                title: 'ລົບສຳເລັດ',
                                desc: 'ລົບສີ້ນຄ້າໃນກະຕ່າ',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              )..show();
                            }
                          },
                          child: Image.network(
                            //"https://i.pinimg.com/564x/16/09/91/1609910dfd9d4fed121026787cde1183.jpg",
                            data['image_url'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 110,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("ຊື່: ${data['name']}"),
                                Text(
                                  "ຈຳນວນ: 1",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "ລາຍລະອຽດປື້ມ: ${data['author']}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "ລາຄາ: ${data['sale_price']} ₭",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                        ),
                      )
                    ]),
                  ),
                );
              },
            );
          },
        ));
  }
}
