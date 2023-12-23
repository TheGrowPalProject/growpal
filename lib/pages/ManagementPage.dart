import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:growpal/pages/SellerFormEdit.dart';

class Item {
  final String name;
  final String image;
  String houseNumber;
  String userId;
  String timeStamp;
  bool preparing;

  Item({
    required this.name,
    required this.image,
    required this.houseNumber,
    required this.userId,
    required this.timeStamp,
    required this.preparing,
  });
}

class Management extends StatefulWidget {
  final Map<String, dynamic> itemData;
  const Management({super.key, this.itemData = const {}});

  @override
  _ManagementState createState() => _ManagementState();
}

class _ManagementState extends State<Management> {
  List<Item> items = [];
  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    final UserId = widget.itemData['Userid'];
    final ProductName = widget.itemData['Product_name'];
    final db = FirebaseFirestore.instance;
    final p = db.collection("orders");
    final querySnapshot = await p
        .where('SellerUserId', isEqualTo: UserId)
        .where("ProductName", isEqualTo: ProductName)
        .where("Status", isNotEqualTo: "Delivered")
        .get();
    setState(() {
      items = querySnapshot.docs.map((e) {
        return Item(
          name: e['BuyerName'],
          image: e['BuyerPhotoUrl'],
          houseNumber: e['BuyerHouseNumber'],
          userId: e['BuyerUserId'],
          timeStamp: e['Timestamp'],
          preparing: e['Status'] == "Preparing",
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (items == []) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      backgroundColor: Colors.black,
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
                      'Manage',
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
            Builder(builder: (context) {
              return MediaQuery.removePadding(
                removeBottom: true,
                context: context,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(32, 31, 38, 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(7),
                  margin: const EdgeInsets.symmetric(vertical: 10),
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
                            image: NetworkImage(widget.itemData['Image']),
                          ),
                        ),
                      ),
                      const SizedBox(width: 35),
                      SizedBox(
                        height: 100,
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.itemData["Product_name"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                              Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SellerFormEdit(product: widget.itemData)));
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(10, 10),
                                  backgroundColor:
                                      const Color.fromRGBO(32, 31, 38, 1.0),
                                  elevation: 0.0),
                              icon: const Icon(
                                Icons.edit,
                                size: 15,
                              ),
                              label: const Text('Edit'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            const Center(
                child: Text("Active orders",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold))),
            Expanded(
              child: ListView(children: [
                for (int index = 0; index < items.length; index++) ...[
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(32, 31, 38, 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(7),
                    margin: const EdgeInsets.symmetric(vertical: 10),
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
                              image: NetworkImage(items[index].image),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Deliver To: ${items[index].houseNumber}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    items[index].preparing = true;
                                  });
                                  final db = FirebaseFirestore.instance;
                                  final p = db.collection("orders");
                                  p
                                      .where('BuyerUserId',
                                          isEqualTo: items[index].userId)
                                      .where("ProductName",
                                          isEqualTo:
                                              widget.itemData["Product_name"])
                                      .where("Timestamp",
                                          isEqualTo: items[index].timeStamp)
                                      .get()
                                      .then((value) {
                                    value.docs.forEach((element) {
                                      print("hello");
                                      print(element);
                                      element.reference.set(
                                          {"Status": "Preparing"},
                                          SetOptions(merge: true));
                                    });
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0.0),
                                icon: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors
                                        .yellow, // Set the background color of the icon
                                  ),
                                  //padding: EdgeInsets.all(5), // Adjust padding if needed
                                  child: const Icon(
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
                                  final db = FirebaseFirestore.instance;
                                  final p = db.collection("orders");
                                  p
                                      .where('BuyerUserId',
                                          isEqualTo: items[index].userId)
                                      .where("ProductName",
                                          isEqualTo:
                                              widget.itemData["Product_name"])
                                      .where("Timestamp",
                                          isEqualTo: items[index].timeStamp)
                                      .get()
                                      .then((value) {
                                    value.docs.forEach((element) {
                                      element.reference.set(
                                          {"Status": "Delivered"},
                                          SetOptions(merge: true));
                                    });
                                  });

                                  setState(() {
                                    print(index);
                                    items.removeAt(index);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0.0),
                                icon: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors
                                        .green, // Set the background color of the icon
                                  ),
                                  //padding: EdgeInsets.all(5), // Adjust padding if needed
                                  child: const Icon(
                                    Icons.check_circle,
                                    color: Colors
                                        .white, // Default color of the tick mark
                                    size: 20,
                                  ),
                                ),
                                label: const Text(
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
                  ),
                ]
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
