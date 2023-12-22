import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class ProdBottomNaviBar extends StatefulWidget {
  final itemData;
  const ProdBottomNaviBar({Key? key, this.itemData = const {}})
      : super(key: key);

  @override
  State<ProdBottomNaviBar> createState() => _ProdBottomNaviBarState();
}

class _ProdBottomNaviBarState extends State<ProdBottomNaviBar> {
  var addToCartText = "Add To Cart";
  var buyNowText = "Buy Now";
  var buttonIcon = const Icon(CupertinoIcons.cart_badge_plus);
  var newIcon = const Icon(CupertinoIcons.money_dollar);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  buttonIcon = const Icon(Icons.done);
                  addToCartText = "Added";
                });
              },
              icon: buttonIcon,
              label: Text(
                addToCartText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 2),
                backgroundColor: const Color(0xfff10100f),
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                var upiId = widget.itemData["UpiId"];
                var amount = widget.itemData["Price"];
                var productName = widget.itemData["Product_name"];
                var userName = widget.itemData["DisplayName"];
                var uri =
                    "upi://pay?pa=$upiId&pn=$userName&am=$amount&tn=$productName&cu=INR";
                var url = Uri.parse(uri);
                var result = await launchUrl(url);
                print(result);
                if (result == true) {
                  print("done, UPI app opened");
                } else if (result == false) {
                  print("fail to open UPI app");
                }
                setState(() {
                  buyNowText = "Bought";
                });
              },
              icon: newIcon,
              label: Text(
                buyNowText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 2),
                backgroundColor: const Color(0xfff10100f),
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
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
