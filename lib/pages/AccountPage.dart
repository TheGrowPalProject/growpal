import 'package:flutter/material.dart';
import 'package:growpal_hackathon/pages/HomePage.dart';

class Item {
  final String name;
  final String image;
  String orderdate;
  bool preparing;
  bool delivered;

  Item(
      {required this.name,
      required this.image,
      required this.orderdate,
      this.preparing = false,
      this.delivered = false});
}

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _currentIndex = 1;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final List<Item> items = [
    Item(
        name: 'Item 1',
        image: 'images/image1.png',
        orderdate: 'Ordered on 9/11/23',
        preparing: true),
    Item(
        name: 'Item 2',
        image: 'images/image5.png',
        orderdate: 'Ordered on 9/11/23',
        preparing: false),
    // Add more items as needed from database
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          // Add actions or navigation based on index here
          _handleNavigation(index);
        },
        backgroundColor: Color.fromRGBO(32, 31, 38, 1.0),
        selectedItemColor: Colors.white.withOpacity(0.6),
        unselectedItemColor: Colors.white.withOpacity(0.6),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange),
            label: 'Sell',
          ),
        ],
      ),
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
              child: ElevatedButton(
                onPressed: () {
                  // Button action
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey, fixedSize: Size(300, 30)),
                child: Text(
                  'Your Orders',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
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
                              image: AssetImage(items[index].image),
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
                                onPressed: () {
                                  setState(() {
                                    items[index].preparing = true;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0.0),
                                icon: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: items[index].preparing
                                          ? Colors.yellow
                                          : Colors.green),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                label: Text(
                                  items[index].preparing
                                      ? 'Preparing...'
                                      : 'Delivered',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    side: BorderSide(color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 25)),
                                child: items[index].preparing
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
                                  if (!items[index]
                                      .preparing) // Showing stars only when preparing is false
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.white),
                                        Icon(Icons.star, color: Colors.white),
                                        Icon(Icons.star, color: Colors.white),
                                        Icon(Icons.star, color: Colors.white),
                                        Icon(Icons.star_outline,
                                            color: Colors.white), // Empty star
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

  void _handleNavigation(int index) {
    // Perform navigation or any specific actions based on the index
    switch (index) {
      case 0:
        // Handle navigation or actions for Home Page
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
        break;
      case 1:
        // Handle navigation or actions for Account Page

        break;
      case 2:
        // Handle navigation or actions for Sell Page
        break;
      default:
        break;
    }
  }
}
