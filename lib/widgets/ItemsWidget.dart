
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../globalVariables.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:growpal/pages/ProdPage.dart';

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
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF10100F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 1.6,
        crossAxisCount: 1,
        shrinkWrap: true,
        children: [
          for (int i = 0; i < (docs?.length ?? 0); i++)
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
              decoration: BoxDecoration(
                color: const Color(0xfff201f26),
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
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      // _navigateToCategoryPage(context, i);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProdPage(itemData: docs?[i] ?? {})));
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
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      docs?[i]["Description"] ?? "",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              )
                            : Container(
                                margin: const EdgeInsets.all(0),
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
                        const SizedBox(width: 15),
                        i.isEven
                            ? Container(
                                margin: const EdgeInsets.all(10),
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
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      docs?[i]["Description"] ?? "",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
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
