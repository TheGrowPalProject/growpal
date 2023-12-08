import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../globalVariables.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var titles = ["Hand Bag", "Earring", "Tupperware Box", "Cable Protectors", "Bottle", "Phone Case", "Stickers"];
    // var discounts = ["50", "5", "20", "10", "7", "25", "15"];
    // var prices = ["999", "199", "499", "99", "599", "299", "49"];
    var db = FirebaseFirestore.instance;
    var p = db.collection("products");
    Future<void> getData() async {
      // Get docs from collection reference
      QuerySnapshot querySnapshot = await p.get();

      // Get data from docs and convert map to List
      final docs = querySnapshot.docs.map((doc) => doc.data()).toList();

      print(docs);
    }

    getData();

    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.68,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 1; i < 9; i++)
          Container(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 5,
              ),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: const Color(0xFF4C53A5),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "-${globalVariables().discounts[i - 1]}%",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "prodPage");
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.asset(
                        "images/image$i.png",
                        height: 100,
                        width: 120,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      globalVariables().titles[i - 1],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        globalVariables().desc[i - 1],
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF4C53A5),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₹${globalVariables().prices[i - 1]}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5),
                            ),
                          ),
                          const Icon(
                            Icons.shopping_cart_checkout,
                            color: Color(0xFF4C53A5),
                            size: 14,
                          ),
                        ],
                      )),
                ],
              )),
      ],
    );
  }
}
