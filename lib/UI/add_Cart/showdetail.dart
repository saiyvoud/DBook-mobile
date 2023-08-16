import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import '../../Provider/order/order_provider.dart';

import '../Play_ment_information/Information_Customer.dart';
import '../Play_ment_information/image_playment_cart.dart';
import '../Play_ment_information/update_infomation_customer_cart.dart';

class ShowDetail extends StatefulWidget {
  final List<dynamic> cart;
  final String totalPrice;
  const ShowDetail({super.key, required this.cart, required this.totalPrice});

  @override
  State<ShowDetail> createState() => _ShowDetailState();
}

class _ShowDetailState extends State<ShowDetail> {
   double?  _totalPrice;
  @override
  void initState() {
    super.initState();
    Provider.of<OrderProvider>(context, listen: false)..getAddress();
  _totalPrice = double.parse(widget.totalPrice.toString()) + double.parse("15000.0");
  }

  @override
  Widget build(BuildContext context) {
    // var format = NumberFormat("###,###", "en_US");
   
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
        ),
        body: Consumer<OrderProvider>(builder: (context, orderProvider, child) {
          if (orderProvider.isLoading == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text('ລາຍລະອຽດສິນຄ້າ',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Spacer(),
                      Icon(Icons.edit, color: Colors.green),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ຊື່',
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                      Text('ຈຳນວນສິນຄ້າ',
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                      Text('ລາຄາ',
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: widget.cart.length,
                    itemBuilder: (context, index) {
                      final data = widget.cart[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${data['name']}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            Text('${data['amount']}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            Text('${data['sale_price']} LAK',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ລາຄາຈັດສົ່ງ',
                          style: TextStyle(fontSize: 12, color: Colors.black)),
                      Text('15,000 LAK',
                          style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ລາຄາລວມ',
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                      Text(
                          '${double.parse(widget.totalPrice.toString()) + double.parse("15000.0")} Kip',
                          style: TextStyle(fontSize: 15, color: Colors.red)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  width: double.infinity,
                  height: 280,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "ຂົນສົ່ງ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Spacer(),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Update_Information_Customer()));
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.green,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      orderProvider.listAddress == null
                          ? TextField(
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(),
                                  labelText: "ກະລຸນາເລືອກສາຂາປາຍທາງ",
                                  fillColor: Colors.grey.shade100,
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Information_Customer()));
                                      },
                                      child: Icon(
                                        Icons.change_history_outlined,
                                        color: Colors.black87,
                                      )),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(60),
                                  )),
                            )
                          : Row(
                              children: [
                                Text(
                                  "ບ້ານ",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Spacer(),
                                Text(orderProvider.listAddress![0].village!),
                              ],
                            ),
                      Row(
                        children: [
                          Text(
                            "ເມືອງ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Text(orderProvider.listAddress![0].district!),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "ແຂວງ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Text(orderProvider.listAddress![0].province!),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "ເບີໂທ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Text(orderProvider.listAddress![0].phone.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "ຊື່ຜູ້ຮັບ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Text(orderProvider.listAddress![0].name!),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "ບໍລິສັດຂົນສົ່ງ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Text(orderProvider.listAddress![0].express!),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "ສາຂາ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Text(orderProvider.listAddress![0].branch!),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                      //padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "ຊ່ອງທາງການສຳລະເງີນ",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                Row(
                  children: [
                    Radio(
                        value: "radio value",
                        groupValue: "group value",
                        onChanged: (value) {
                          print(value); //selected value
                        }),
                    Text(
                      "ຈ່າຍຜ່ານປາຍທາງ",
                      style: TextStyle(fontSize: 19),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "ລວມທັງໝົດ",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "${_totalPrice} LAK",
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () {
                       
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Image_PlaymentCart(
                                      books: widget.cart,
                                      address_id:
                                          orderProvider.listAddress![0].id!)));
                        },
                        child: Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "ຊຳລະ",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }
}
