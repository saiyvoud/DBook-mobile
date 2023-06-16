

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'MY_Order/My_Order.dart';
import 'add_Cart/cart.dart';
import 'home_page.dart';
class NavigationMainPage extends StatefulWidget {

  const NavigationMainPage({Key? key}) : super(key: key);

  @override
  State<NavigationMainPage> createState() => _NavigationMainPageState();
}
class _NavigationMainPageState extends State<NavigationMainPage> {
  int _currentIndex=0;
  List _screens=[HomePage(),Cart_screen(),My_Order()];
  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      bottomNavigationBar:BottomNavigationBar(
        //backgroundColor: Colors.purple.shade100,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap:_updateIndex ,
        //selectedItemColor: Colors.blue[700],
        selectedItemColor: Colors.lightBlue[900],
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Colors.black87,
            label: "ໜ້າຫລັກ",
            icon: Icon(Icons.home,),),
          BottomNavigationBarItem(
            label: "cart",
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: "ອໍເດິຂອງຂ້ອຍ",
            icon: Icon(Icons.shopping_bag_sharp),
          ),
          // BottomNavigationBarItem(
          //   label: "ລາຍການສັ່ງຊື້ປື້ມ",
          //   icon: Icon(Icons.list),
          // ),
        ],
      ),
      body: _screens[_currentIndex],
    );
  }
}

