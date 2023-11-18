import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexx,
        onTap: (index) {
          setState(() {
            indexx = index;
          });
        },
        backgroundColor: Color(0xFF191414),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.cart_fill,
              size: 30,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              size: 30,
            ),
            label: 'List',
          ),
        ],
      ),
    );
  }
}
