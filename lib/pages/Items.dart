import 'package:flutter/material.dart';
import '../globalVariables.dart';
import '../widgets/CartAppbar.dart';
import '../widgets/CartBottomNaviBar.dart';
import '../widgets/CartItems.dart';
import 'AboutPage.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Spacer(),
              Text(
                'GrowPal',
                style: TextStyle(fontSize: 29),
              ),
              Spacer(flex: 400),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(height: 29),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 28.0),
            child: Container(
              height: 61,
              width: 293,
              decoration: BoxDecoration(
                color: Color(0xFFF1D1D1D),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  'Your Items',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: Color(0xFFF1D1D1D),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    "images/image2.png",
                    height: 110,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Strawberry Cupcake",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    buildButtonWithIcon("Edit", Icons.edit, () {}),
                    SizedBox(height: 0),
                    buildButtonWithIcon("Manage", Icons.settings, () {}),
                    SizedBox(height: 0),
                    buildButtonWithIcon("Delete", Icons.delete, () {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonWithIcon(
      String text, IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 18,
            ),
            SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
