import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;
import 'package:permission_handler/permission_handler.dart';

class Item {
  final String name;
  final String image;
  final String sellerUserId;
  final String sellerPhoneNumber;
  String orderdate;
  bool preparing;
  bool delivered;
  int rating;

  Item({
    required this.name,
    required this.image,
    required this.sellerUserId,
    required this.sellerPhoneNumber,
    required this.orderdate,
    required this.preparing,
    required this.delivered,
    this.rating = 0,
  });
}

class YourOrdersPage extends StatefulWidget {
  @override
  _YourOrdersPageState createState() => _YourOrdersPageState();
}

class _YourOrdersPageState extends State<YourOrdersPage> {
  List<Item> items = [];
  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    final UserId = FirebaseAuth.instance.currentUser?.uid ?? "";
    final db = FirebaseFirestore.instance;
    final p = db.collection("orders");
    final querySnapshot = await p
        .where("BuyerUserId", isEqualTo: UserId)
        .orderBy("Timestamp", descending: true)
        .get();
    setState(() {
      items = querySnapshot.docs.map((e) {
        int epochMilliseconds = int.parse(e['Timestamp']);
        var date = DateTime.fromMillisecondsSinceEpoch(epochMilliseconds);
        var formattedDate = DateFormat('dd-MM-yyyy hh:mm a').format(date);
        return Item(
          name: e['ProductName'],
          image: e['ProductImageUrl'],
          sellerUserId: e['SellerUserId'],
          sellerPhoneNumber: e["SellerPhoneNumber"],
          orderdate: formattedDate,
          preparing: e['Status'] == "Preparing",
          delivered: e['Status'] == "Delivered",
        );
      }).toList();
    });
  }

  void _makePhoneCall(String phoneNumber) async {

  final url = Uri.parse('tel:$phoneNumber');
  await launchUrl(url);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              'GrowPal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 28.0),
                child: Container(
                  height: 61,
                  width: 293,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1D1D1D),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      'Orders',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //SizedBox(height: 2),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 220,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(32, 31, 38, 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              alignment: Alignment.bottomCenter,
                              image: NetworkImage(items[index].image),
                            ),
                          ),
                        ),
                        SizedBox(width: 35),
                        Container(
                          height: 200,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                items[index].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                items[index].orderdate,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0.0),
                                icon: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: !items[index].delivered
                                          ? Colors.yellow
                                          : Colors.green),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                label: Text(
                                  !items[index].delivered
                                      ? items[index].preparing
                                          ? 'Preparing'
                                          : 'Placed'
                                      : 'Delivered',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (items[index].delivered) {
                                    var db = FirebaseFirestore.instance;
                                    DocumentSnapshot productDeetsSnapshot =
                                        await db
                                            .collection("products")
                                            .doc(items[index].sellerUserId +
                                                "_" +
                                                items[index].name)
                                            .get();
                                    Map<String, dynamic> productDeets =
                                        productDeetsSnapshot.exists
                                            ? productDeetsSnapshot.data()
                                                as Map<String, dynamic>
                                            : {};
                                    var upiId = productDeets["UpiId"];
                                    var amount = productDeets["Price"];
                                    var productName =
                                        productDeets["Product_name"];
                                    var userName = productDeets["DisplayName"];
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

                                    final User? user =
                                        FirebaseAuth.instance.currentUser;
                                    final loggedInUserId = user?.uid;
                                    final loggedInUserName = user?.displayName;
                                    final loggedInUserPhotoUrl = user?.photoURL;
                                    SharedPreferences pref =
                                        await SharedPreferences.getInstance();
                                    final buyerHouseNumber =
                                        pref.getString("houseNumber");
                                    final orderDeets = {
                                      "Timestamp": DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString(),
                                      "SellerUserId": productDeets["Userid"],
                                      "ProductName":
                                          productDeets["Product_name"],
                                      "ProductImageUrl": productDeets["Image"],
                                      "BuyerUserId": loggedInUserId,
                                      "BuyerName": loggedInUserName,
                                      "BuyerPhotoUrl": loggedInUserPhotoUrl,
                                      "BuyerHouseNumber": buyerHouseNumber,
                                      "Status": "Placed",
                                    };
                                    await db
                                        .collection("orders")
                                        .doc()
                                        .set(orderDeets);
                                    _fetchItems();
                                  } else {
                                    _makePhoneCall(items[index].sellerPhoneNumber);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    side: BorderSide(color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 25)),
                                child: !items[index].delivered
                                    ? Text(
                                        "Contact Seller",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text("Buy Again",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (!items[index].preparing)
                                    Row(
                                      children: [
                                        // Filled stars based on the rating
                                        ...List.generate(
                                          items[index].rating,
                                          (index) => Icon(Icons.star,
                                              color: Colors.yellow),
                                        ),
                                        // Empty stars for the remaining
                                        ...List.generate(
                                          5 - items[index].rating,
                                          (index) => Icon(Icons.star_border,
                                              color: Colors.yellow),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
