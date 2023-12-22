import 'package:flutter/material.dart';
import 'package:growpal_hackathon/pages/HomePage.dart';

class Item {
  final String name;
  final String image;

  Item({required this.name, required this.image});
}

class YourItemsPage extends StatefulWidget {
  const YourItemsPage({super.key});

  @override
  _YourItemsPageState createState() => _YourItemsPageState();
}

class _YourItemsPageState extends State<YourItemsPage> {
  int _currentIndex = 1;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final List<Item> items = [
    Item(name: 'Item 1', image: 'images/image1.png'),
    Item(name: 'Item 2', image: 'images/image5.png'),
    Item(name: 'Item 3', image: 'images/image7.png'),
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
        backgroundColor: const Color.fromRGBO(32, 31, 38, 1.0),
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
            const SizedBox(height: 40),
            const Text(
              'GrowPal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Button action
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey, fixedSize: const Size(300, 30)),
                child: const Text(
                  'Your Items',
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
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(32, 31, 38, 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              alignment: Alignment.bottomCenter,
                              image: AssetImage(items[index].image),
                            ),
                          ),
                        ),
                        const SizedBox(width: 35),
                        SizedBox(
                          height: 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                items[index].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Edit action
                                },
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(10, 10),
                                    backgroundColor: Colors.transparent,
                                    elevation: 0.0),
                                icon: const Icon(
                                  Icons.edit,
                                  size: 15,
                                ),
                                label: const Text('Edit'),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Manage action
                                },
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(10, 10),
                                    backgroundColor: Colors.transparent,
                                    elevation: 0.0),
                                icon: const Icon(
                                  Icons.manage_accounts,
                                  size: 15,
                                ),
                                label: const Text('Manage'),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Delete action
                                },
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(10, 10),
                                    backgroundColor: Colors.transparent,
                                    elevation: 0.0),
                                icon: const Icon(
                                  Icons.delete,
                                  size: 15,
                                ),
                                label: const Text('Delete'),
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
          return const HomePage();
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
