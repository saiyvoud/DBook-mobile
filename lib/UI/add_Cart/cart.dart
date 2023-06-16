import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          //backgroundColor: Colors.blueGrey[90],
          appBar: AppBar(
            backgroundColor: Colors.lightBlue[900],
            centerTitle: true,
            title: Text("ກະຕ່າ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 140),
                  child: Text("ບໍ່ມີຂໍ້ມູນ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
              // Row(
              //   children: [
              //     Radio(
              //         value: "radio value",
              //         groupValue: "group value",
              //         onChanged: (value){
              //           print(value); //selected value
              //         }
              //     ),
              //   ],
              // )
            ],
          ),
        )
    );
  }
}






