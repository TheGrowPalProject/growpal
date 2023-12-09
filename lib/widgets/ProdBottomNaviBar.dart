import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProdBottomNaviBar extends StatefulWidget {
  const ProdBottomNaviBar({Key? key}) : super(key: key);

  @override
  State<ProdBottomNaviBar> createState() => _ProdBottomNaviBarState();
}

class _ProdBottomNaviBarState extends State<ProdBottomNaviBar> {
  var addToCartText = "Add To Cart";
  var buyNowText = "Buy Now";
  var buttonIcon = Icon(CupertinoIcons.cart_badge_plus);
  var newIcon = Icon(CupertinoIcons.money_dollar);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  buttonIcon = Icon(Icons.done);
                  addToCartText = "Added";
                });
              },
              icon: buttonIcon,
              label: Text(
                addToCartText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                side:
                    BorderSide(color: Colors.white, width: 2), // Add this line
                primary: Color(0xFFF10100F),
                padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  buyNowText = "Bought";
                });
              },
              icon: newIcon,
              label: Text(
                buyNowText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                side:
                    BorderSide(color: Colors.white, width: 2), // Add this line
                primary: Color(0xFFF10100F),
                padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
