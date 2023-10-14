import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../globalVariables.dart';

class ProdBottomNaviBar extends StatefulWidget {
  const ProdBottomNaviBar({Key? key}) : super(key: key);

  @override
  State<ProdBottomNaviBar> createState() => _ProdBottomNaviBarState();
}

class _ProdBottomNaviBarState extends State<ProdBottomNaviBar> {
  var buttonText = "Add To Cart";
  var buttonIcon = Icon(CupertinoIcons.cart_badge_plus);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3),

            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
            "₹999",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4C53A5),

        ),

        ),

            ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    cartItems = 1;
                    buttonIcon = Icon(Icons.done);
                    buttonText = "Added";
                  });
                },
                icon: buttonIcon,
                label: Text(
                  buttonText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,

                ),
                ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF4C53A5)),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

                ),
          ],
        )
      ),
    );
  }
}
