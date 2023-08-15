import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dbook_project/Provider/order/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Consumer<OrderProvider>(builder: (context, cart, child) {
      if (cart.isLoading == true) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue[900],
            centerTitle: true,
            title: Text(
              "ກະຕ່າ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          bottomNavigationBar: cart.success == false
              ? Text("")
              : Container(
                  height: 60,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 1),
                        child: Text(
                          "ລາຄາລວມ: ${cart.total.toString()}",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Spacer(),
                      Container(
                        //margin: EdgeInsets.only(left: 80),
                        width: 100,
                        height: 40,
                        child: FloatingActionButton(
                            backgroundColor: Colors.lightBlue[900],
                            child: Text(
                              "ຊຳລະ",
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onPressed: () {}),
                      )
                    ],
                  ),
                ),
          body: cart.success == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "ບໍ່ມີຂໍ້ມູນ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: Container(
                    child: ListView.builder(
                      itemCount: cart.cart.length,
                      itemBuilder: (context, index) {
                        final data = cart.cart[index];

                        return Column(
                          children: [
                            Card(
                              elevation: 3,
                              child: Container(
                                // height: 120,
                                width: double.infinity,
                                child: Row(children: [
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.network(
                                          // "https://cdn.elearningindustry.com/wp-content/uploads/2016/05/top-10-books-every-college-student-read-1024x640.jpeg",
                                          "${data['image_url']}",
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    height: 150,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "ຊື່ປື້ມ: ${data['name']}",
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

                                            //delete icon

                                            InkWell(
                                              onTap: () {
                                                cart.deleteCart(id: data['id']);
                                                if (cart.success == true) {
                                                  AwesomeDialog(
                                                    context: context,
                                                    dialogType:
                                                        DialogType.SUCCES,
                                                    animType:
                                                        AnimType.RIGHSLIDE,
                                                    title: 'ສຳເລັດ',
                                                    desc: 'ລົບສີ້ນຄ້າອອກກະຕ່າ',
                                                    btnCancelOnPress: () {},
                                                    btnOkOnPress: () {},
                                                  )..show();
                                                }
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 190),
                                                  child: Icon(
                                                    Icons.delete,
                                                    size: 30,
                                                    color: Colors.red,
                                                  )),
                                            ),

                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 70),
                                              child: Row(children: [
                                                OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      shape: CircleBorder(),
                                                      backgroundColor: Colors
                                                          .red
                                                          .shade100, //<-- SEE HERE
                                                    ),
                                                    onPressed: () {
                                                      if (data['amount'] == 1) {
                                                        cart.deleteCart(
                                                            id: data['id']);
                                                        AwesomeDialog(
                                                          context: context,
                                                          dialogType:
                                                              DialogType.SUCCES,
                                                          animType: AnimType
                                                              .RIGHSLIDE,
                                                          title: 'ສຳເລັດ',
                                                          desc:
                                                              'ລົບສີ້ນຄ້າອອກກະຕ່າ',
                                                          btnCancelOnPress:
                                                              () {},
                                                          btnOkOnPress: () {},
                                                        )..show();
                                                      } else {
                                                        cart.removeAmountCartFirebase(
                                                            id: data['id']);
                                                        if (cart.success ==
                                                            true) {
                                                          AwesomeDialog(
                                                            context: context,
                                                            dialogType:
                                                                DialogType
                                                                    .SUCCES,
                                                            animType: AnimType
                                                                .RIGHSLIDE,
                                                            title: 'ສຳເລັດ',
                                                            desc:
                                                                'ລົບຈຳນວນສີ້ນຄ້າຈາກກະຕ່າ',
                                                            btnCancelOnPress:
                                                                () {},
                                                            btnOkOnPress: () {},
                                                          )..show();
                                                        } else {}
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 35,
                                                      height: 35,
                                                      padding: EdgeInsets.only(
                                                          bottom: 4, left: 1),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "-",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 30,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    )),
                                                Text(
                                                  " ${data['amount']}",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 20),
                                                ),
                                                OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      shape: CircleBorder(),
                                                      backgroundColor: Colors
                                                          .red
                                                          .shade100, //<-- SEE HERE
                                                    ),
                                                    onPressed: () {
                                                      cart.addAmountCartFirebase(
                                                          id: data['id']);
                                                      AwesomeDialog(
                                                        context: context,
                                                        dialogType:
                                                            DialogType.SUCCES,
                                                        animType:
                                                            AnimType.RIGHSLIDE,
                                                        title: 'ສຳເລັດ',
                                                        desc:
                                                            'ເພີ່ມສີ້ນຄ້າສຳເລັດ',
                                                        btnCancelOnPress: () {},
                                                        btnOkOnPress: () {},
                                                      )..show();
                                                    },
                                                    child: Container(
                                                      width: 35,
                                                      height: 35,
                                                      padding: EdgeInsets.only(
                                                          bottom: 4, left: 1),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "+",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 30,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    )),
                                              ]),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ));
    });
  }
}
