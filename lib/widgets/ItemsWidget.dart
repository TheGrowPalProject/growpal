
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../globalVariables.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  List<Map<String, dynamic>>? docs;

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    final db = FirebaseFirestore.instance;
    final p = db.collection("products");
    final querySnapshot = await p.get();
    setState(() {
      docs = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (docs == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF10100F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 1.6,
        crossAxisCount: 1,
        shrinkWrap: true,
        children: [
          for (int i = 0; i < (docs?.length ?? 0); i++)
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
              decoration: BoxDecoration(
                color: Color(0xFFF201F26),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: i.isEven
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.start,
                  ),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      _navigateToCategoryPage(context, i);
                    },
                    child: Row(
                      children: [
                        i.isEven
                            ? Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      docs?[i]["Product_name"] ?? "",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      docs?[i]["Description"] ?? "",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                height: 130,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    docs?[i]["Image"] ?? "",
                                    height: 140,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                        SizedBox(width: 15),
                        i.isEven
                            ? Container(
                                margin: EdgeInsets.all(10),
                                height: 130,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    docs?[i]["Image"] ?? "",
                                    height: 140,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      docs?[i]["Product_name"] ?? "",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      docs?[i]["Description"] ?? "",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: i.isEven
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.start,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}







void _navigateToCategoryPage(BuildContext context, int categoryIndex) {
  switch (categoryIndex) {
    case 1:
      Navigator.pushNamed(context, "prodPage");
      break;
    case 2:
      Navigator.pushNamed(context, "categoryPage2");
      break;
    // Add more cases for each category
  }
}
