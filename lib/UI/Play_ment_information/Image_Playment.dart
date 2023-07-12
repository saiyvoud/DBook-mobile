import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dbook_project/Provider/order/order_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Bill_Pay_dart.dart';

class Image_Playment extends StatefulWidget {
  static const routeName = "/Image_Playment";

  @override
  State<Image_Playment> createState() => _Image_PlaymentState();
}

class _Image_PlaymentState extends State<Image_Playment> {
  File? file;
  String? docImage;
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 60),
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
                    height: 200,
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bill_Pay()));
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
