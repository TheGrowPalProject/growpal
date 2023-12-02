import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProdBottomNaviBar extends StatefulWidget {
  const ProdBottomNaviBar({Key? key}) : super(key: key);

  @override
  State<ProdBottomNaviBar> createState() => _ProdBottomNaviBarState();
}

class _ProdBottomNaviBarState extends State<ProdBottomNaviBar> {
  var buttonText = "Add To Cart";
  var buttonIcon = const Icon(CupertinoIcons.cart_badge_plus);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),

            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
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
                    buttonIcon = const Icon(Icons.done);
                    buttonText = "Added";
                  });
                },
                icon: buttonIcon,
                label: Text(
                  buttonText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,

                ),
                ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color(0xFF4C53A5)),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
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
