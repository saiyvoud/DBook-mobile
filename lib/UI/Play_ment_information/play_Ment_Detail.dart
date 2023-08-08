import 'package:dbook_project/Provider/order/order_provider.dart';
import 'package:dbook_project/model/books_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'Image_Playment.dart';
import 'Information_Customer.dart';

class Play_Ment_Detail extends StatefulWidget {
  final BooksModel booksModel;
  final int qty;
  static const routeName = "/Play_Ment_Detail";

  const Play_Ment_Detail(
      {super.key, required this.booksModel, required this.qty});

  @override
  State<Play_Ment_Detail> createState() => _Play_Ment_DetailState();
}

class _Play_Ment_DetailState extends State<Play_Ment_Detail> {
  @override
  void initState() {
    super.initState();
    Provider.of<OrderProvider>(context, listen: false)..getAddress();
  }

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat("###,###", "en_US");

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
        ),
        backgroundColor: Colors.red.shade50,
        body: Consumer<OrderProvider>(builder: (context, orderProvider, child) {
          if (orderProvider.isLoading == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 5,
                  left: 20,
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        //   SizedBox(height: 12,),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.network(
                                widget.booksModel.image_url!,
                                fit: BoxFit.cover,
                              ),
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "ຊື່ປື້ມ: ${widget.booksModel.name}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "ຈຳນວນ: ${widget.qty}",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "ລາຄາ: ${format.format(widget.booksModel.sale_price)} LAK",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 17),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                height: 125.0,
                width: double.infinity,
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    width: double.infinity,
                    height: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ຂົນສົ່ງ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
                            : Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "ບ້ານ",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Spacer(),
                                        Text(orderProvider
                                            .listAddress![0].village!),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "ເມືອງ",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Spacer(),
                                        Text(orderProvider
                                            .listAddress![0].district!),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "ແຂວງ",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Spacer(),
                                        Text(orderProvider
                                            .listAddress![0].province!),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "ເບີໂທ",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Spacer(),
                                        Text(orderProvider.listAddress![0].phone
                                            .toString()),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "ຊື່ຜູ້ຮັບ",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Spacer(),
                                        Text(orderProvider
                                            .listAddress![0].name!),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "ບໍລິສັດຂົນສົ່ງ",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Spacer(),
                                        Text(orderProvider
                                            .listAddress![0].express!),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "ສາຂາ",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Spacer(),
                                        Text(orderProvider
                                            .listAddress![0].branch!),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "ລາຄາຈັດສົ່ງ: 15,000 LAK",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 90,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "ຊ່ອງທາງການສຳລະເງີນ",
                                style: TextStyle(fontSize: 20),
                              )),
                          Row(
                            children: [
                              // Container(padding: EdgeInsets.only(left: 100,top:10),
                              //     child: Text("ຈ່າຍຜ່ານປາຍທາງ",style: TextStyle(fontSize: 20),))
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
                          )
                        ]),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "ລວມທັງໝົດ",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "${format.format(widget.qty * widget.booksModel.sale_price! + 15000)} LAK",
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () {
                          print(orderProvider.listAddress![0].id!);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Image_Playment(
                                      booksModel: widget.booksModel,
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
                  )
                ],
              ),
            ],
          ));
        }));
  }
}
