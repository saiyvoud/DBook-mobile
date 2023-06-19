import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bill_Pay_dart.dart';

class Image_Playment extends StatefulWidget {
  static const routeName = "/Image_Playment";

  @override
  State<Image_Playment> createState() => _Image_PlaymentState();
}

class _Image_PlaymentState extends State<Image_Playment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ໃສ່ຮູບການຈ່າຍເງີນ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, top: 100),
            child: Icon(
              Icons.image,
              size: 300,
              color: Colors.grey.shade300,
            ),
          ),
          SizedBox(
            height: 200,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "ຍົກເລີກ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Bill_Pay()));
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: Text(
                "ບັນທຶກ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),

          // Container(
          //   padding: EdgeInsets.only(left: 30),
          //   child: FlatButton(
          //     height: 60,
          //     minWidth: 200,
          //     onPressed: () {},
          //     color: Colors.blue,
          //     child: InkWell(
          //         onTap: () {
          //           Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => Bill_Pay()));
          //         },
          //         child: Text(
          //           "ບັນທືກ",
          //           style: TextStyle(fontSize: 22),
          //         )),
          //     textColor: Colors.white,
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10)),
          //   ),
          // )
        ],
      ),
    );
  }
}
