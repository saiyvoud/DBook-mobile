import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dbook_project/Provider/order/order_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Image_Playment extends StatefulWidget {
  static const routeName = "/Image_Playment";

  @override
  State<Image_Playment> createState() => _Image_PlaymentState();
}

class _Image_PlaymentState extends State<Image_Playment> {
  File? file;
  String? docImage;
  @override
  void initState() {
    super.initState();
    Provider.of<OrderProvider>(context, listen: false)..getPayments();
  }

  void showAlert(OrderProvider orderProvider) {
    showDialog(
        context: context,
        builder: (context) {
          return Container(
            height: 150,
            child: AlertDialog(
              title: Text('ເລືອກປະເພດຮູບພາບ'),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      var files = await orderProvider.pickCamera();
                      var cropImage = await orderProvider.cropImage(
                          imageFile: files!, context: context);
                      File fileName = File(cropImage!.path);
                      Uint8List imagebytes = await fileName.readAsBytes();
                      String base64string = base64.encode(imagebytes);
                      setState(() {
                        file = fileName;
                        docImage = "data:image/jpg;base64,${base64string}";
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera_alt),
                        SizedBox(width: 10),
                        Text("ຖ່າຍພາບ"),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      var files = await orderProvider.pickGallery();
                      var cropImage = await orderProvider.cropImage(
                          imageFile: files!, context: context);
                      File fileName = File(cropImage!.path);
                      Uint8List imagebytes = await fileName.readAsBytes();
                      String base64string = base64.encode(imagebytes);
                      setState(() {
                        file = fileName;
                        docImage = "data:image/jpg;base64,${base64string}";
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.photo),
                        SizedBox(width: 10),
                        Text("ເລືອກຮູບພາບ"),
                      ],
                    ),
                  )
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Close",
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ໃສ່ຮູບການຈ່າຍເງີນ",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Consumer<OrderProvider>(
          builder: (context, orderProvider, child) {
            if (orderProvider.isLoading == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            // if (orderProvider.listPayment == null) {
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 180,
                              width: 180,
                              child: Image.network(
                                orderProvider.listPayment![0].image_url!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            orderProvider.listPayment![0].name!,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 180,
                              width: 180,
                              child: Image.network(
                                orderProvider.listPayment![1].image_url!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            orderProvider.listPayment![1].name!,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      showAlert(orderProvider);
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: file == null
                          ? Icon(
                              Icons.image,
                              size: 300,
                              color: Colors.grey.shade300,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: 200,
                                child: Image.file(
                                  file!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "ຍົກເລີກ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        onTap: () {
                          if (file == null) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.RIGHSLIDE,
                              title: 'ແຈ້ງເຕືອນ',
                              desc: 'ຕ້ອງສົ່ງໃບບິນການໂອນກ່ອນ!',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            )..show();
                          }
                        },
                        child: Container(
                          height: 60,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "ບັນທຶກ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
