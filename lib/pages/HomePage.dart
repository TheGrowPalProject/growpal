import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:growpal_hackathon/pages/CartPage.dart';


import 'AboutPage.dart';
import 'Home_Page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final screens = [
    Home_Page(),
    CartPage(),
    AboutPage(),
  ];
  var indexx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[indexx],

      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 200),
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            indexx = index;
          });
        },
        height: 70,
        color: Color(0xFF4C53A5),
        items: [
          Icon(
              Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            CupertinoIcons.cart_fill,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
