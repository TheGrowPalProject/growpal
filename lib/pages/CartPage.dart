import 'package:flutter/material.dart';

import '../globalVariables.dart';
import '../widgets/CartAppbar.dart';
import '../widgets/CartBottomNaviBar.dart';
import '../widgets/CartItems.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var price = 0;

  void handlePrice(price_given){
    setState(() {
      price = globalVariables().price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CartAppBar(),

          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFF212121),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
              ),

            ),
            child: Column(
              children: [
                CartItems(),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF4C53A5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Add Coupon Code",
                          style: TextStyle(
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )
                        )
                      ),
                    ],
                  )
                ),
            ]
            ),
          ),
        ],
      ),
      bottomNavigationBar: CartBottomNaviBar(),
    );
  }
}
