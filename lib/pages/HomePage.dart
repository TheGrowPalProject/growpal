import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:growpal_hackathon/pages/CartPage.dart';
import 'package:growpal_hackathon/pages/SellerForm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../globalVariables.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'Home_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final screens = [
    const Home_Page(),
    const CartPage(),
    const SellerForm(),
  ];
  var indexx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexx],
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 200),
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            indexx = index;
          });
        },
        height: 70,
        color: const Color(0xFF4C53A5),
        items: const [
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
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
