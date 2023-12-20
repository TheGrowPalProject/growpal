import 'package:flutter/material.dart';
import 'package:growpal_hackathon/pages/HomePage.dart';

class Item1 {
  final String name;
  final String image;

  Item1({required this.name, required this.image});
}

class Item {
  final String name;
  final String image;
  String address;
  int quantity;
  String note;
  bool preparing;

  Item({
    required this.name,
    required this.image,
    required this.address,
    required this.quantity,
    required this.note,
    this.preparing = false,
  });
}

class Management extends StatefulWidget {
  @override
  _ManagementState createState() => _ManagementState();
}

class _ManagementState extends State<Management> {
  int _currentIndex = 1;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final List<Item1> items1 = [
    Item1(name: 'Item 1', image: 'images/image1.png'),
    // Add more items as needed from database
  ];
  final List<Item> items = [
    Item(
      name: 'Name 1',
      image: 'images/image_9.png',
      address: '1234 Street Name',
      quantity: 2,
      note: 'Some note about Item 1',
    ),
    Item(
      name: 'Name 2',
      image: 'images/image_11.png',
      address: '9999 Road',
      quantity: 3,
      note: 'Additional note for Item 2',
    ),
    // Add more items as needed from the database
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
                  primary: Colors.grey,
                  fixedSize: Size(300, 30),
                ),
                child: Text(
                  'Manage',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Builder(
              builder: (context) {
                return MediaQuery.removePadding(
                  removeBottom: true,
                  context: context,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items1.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(32, 31, 38, 1.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.bottomCenter,
                                  image: AssetImage(items1[index].image),
                                ),
                              ),
                            ),
                            SizedBox(width: 35),
                            Container(
                              height: 100,
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    items1[index].name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      // Edit action
                                    },
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(10, 10),
                                        backgroundColor:
                                            Color.fromRGBO(32, 31, 38, 1.0),
                                        elevation: 0.0),
                                    icon: Icon(
                                      Icons.edit,
                                      size: 15,
                                    ),
                                    label: Text('Edit'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            ),
            SizedBox(height: 10,),
            Center(
                child: Text("Active orders",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold))),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(32, 31, 38, 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(7),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              alignment: Alignment.bottomCenter,
                              image: AssetImage(items[index].image),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Address: ${items[index].address}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Quantity: ${items[index].quantity}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Note: ${items[index].note}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    items[index].preparing = true;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    elevation: 0.0),
                                icon: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors
                                        .yellow, // Set the background color of the icon
                                  ),
                                  //padding: EdgeInsets.all(5), // Adjust padding if needed
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors
                                        .white, // Default color of the tick mark
                                    size: 20,
                                  ),
                                ),
                                label: Text(
                                  items[index].preparing
                                      ? 'Preparing...'
                                      : 'Mark as Preparing',
                                  style: TextStyle(
                                    color: items[index].preparing
                                        ? Colors.yellow
                                        : Colors.white,
                                  ),
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Mark as Done action
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    elevation: 0.0),
                                icon: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors
                                        .green, // Set the background color of the icon
                                  ),
                                  //padding: EdgeInsets.all(5), // Adjust padding if needed
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors
                                        .white, // Default color of the tick mark
                                    size: 20,
                                  ),
                                ),
                                label: Text(
                                  'Mark as Done',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
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
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
        break;
      case 1:
      // Handle navigation or actions for account page
        break;
      case 2:
        // Handle navigation or actions for Sell Page
        break;
      default:
        break;
    }
  }
}
