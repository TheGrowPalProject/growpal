import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:growpal_hackathon/globalVariables.dart';


class CartBottomNaviBar extends StatefulWidget {
  const CartBottomNaviBar({Key? key}) : super(key: key);
  @override
  State<CartBottomNaviBar> createState() => CartBottomNaviBarState();
}

class CartBottomNaviBarState extends State<CartBottomNaviBar> {
  var price = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price = globalVariables().price;
  }
  Widget build(BuildContext context) {

    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [



            InkWell(
              onTap: () {
                if(globalVariables().checkoutPermit){
                  Navigator.pushNamed(context, "confirmation");
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF4C53A5),
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Text(
                  "Check Out",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );

  }


}
