import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:growpal/globalVariables.dart';

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

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 280.0,
              height: 50.0,
              child: ElevatedButton(
                  onPressed: () {
                    if (globalVariables().checkoutPermit) {
                      _showAlertDialog(context);
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF4C53A5)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  child: const Text(
                    "Check Out",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _showAlertDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Are You Sure?"),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "checkout");
              HapticFeedback.heavyImpact();
            },
          ),
        ],
      );
    },
  );
}
