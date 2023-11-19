import 'package:flutter/material.dart';
import 'package:growpal_hackathon/pages/CartPage.dart';
import 'package:growpal_hackathon/widgets/HomeAppBar.dart';
import 'package:growpal_hackathon/widgets/CategoriesWidget.dart';
import 'package:growpal_hackathon/widgets/ItemsWidget.dart';
import 'AboutPage.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191414),
      body: Stack(
        children: [
          ListView(
            children: [
              const HomeAppBar(),
              Container(
                padding: const EdgeInsets.only(top: 15),
                decoration: const BoxDecoration(
                  color: Color(0xFF191414),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: const Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Categories
                    const CategoriesWidget(),
                    //Items
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: const Text(
                        "Best Selling",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // ItemsWidget
                    ItemsWidget(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 55,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 89, 89, 94),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    size: 27,
                    color: Color.fromARGB(255, 219, 215, 215),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    height: 50,
                    width: 200,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search here",
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.camera_alt,
                    size: 27,
                    color: Color(0xFFB3B3B3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
