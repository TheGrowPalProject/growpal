import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:growpal_hackathon/pages/CartPage.dart';
import 'package:growpal_hackathon/pages/SellerForm.dart';
import 'package:growpal_hackathon/pages/AccountPage.dart';
import 'Home_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final screens = [
    const Home_Page(),
    const AccountPage(),
    const SellerForm(),
  ];
  var indexx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[indexx],
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 65,
          padding: const EdgeInsets.only(top: 1),
          child: BottomNavigationBar(
            currentIndex: indexx,
            onTap: (index) {
              setState(() {
                indexx = index;
              });
            },
            backgroundColor: const Color(0xfff1d1d1d),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                label: 'Account',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.currency_exchange,
                  size: 30,
                ),
                label: 'Sell',
              ),
            ],
          ),
        ));
  }
}
