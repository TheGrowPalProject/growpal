import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:growpal_hackathon/pages/HomePage.dart';
import '../widgets/ProdAppBar.dart';
import '../widgets/ProdBottomNaviBar.dart';

class ProdPage extends StatefulWidget {
  final Map<String, dynamic> itemData;
  const ProdPage({Key? key, this.itemData = const {}}) : super(key: key);

  @override
  State<ProdPage> createState() => _ProdPageState();
}

class _ProdPageState extends State<ProdPage> {
  var quantity = 1;

  @override
  Widget build(BuildContext context) {
    print(widget.itemData);
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          ProdAppBar(),
          Container(
            margin: EdgeInsets.all(15),
            width: double.infinity,
            height: 700,
            decoration: const BoxDecoration(
              color: Color(0xFF10100F),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
                bottomRight: Radius.circular(35),
                bottomLeft: Radius.circular(35),
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color(0xFFF201F26),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.itemData["Image"],
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.itemData["Product_name"],
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "₹ ${widget.itemData["Price"]}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        bottom: 10,
                        right: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => Icon(
                              Icons.star, // Replaced with star icon
                              color: Colors.white,
                            ),
                            onRatingUpdate: (index) {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            widget.itemData["Description"],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              SizedBox(width: 25),
                              CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage("images/avatar.jpeg"),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Alex Wright",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Sunny Vale Apartments, Blr",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: ProdBottomNaviBar(),
    );
  }
}
