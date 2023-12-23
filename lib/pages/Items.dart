import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:growpal/pages/SellerFormEdit.dart';
import 'ManagementPage.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  List<Map<String, dynamic>>? docs;

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final UserId = user?.uid;
    final db = FirebaseFirestore.instance;
    final p = db.collection("products");
    final querySnapshot = await p
        .where('Userid', isEqualTo: UserId)
        .orderBy("Date", descending: true)
        .get();
    setState(() {
      docs = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (docs == null) {
      return const Center(child: CircularProgressIndicator());
    }
    print(docs);
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
          for (int i = 0; i < (docs?.length ?? 0); i++) ...[
            SizedBox(height: 20),
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
                    child: Image.network(
                      docs?[i]["Image"] ?? "",
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
                        docs?[i]["Product_name"],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      buildButtonWithIcon("Edit", Icons.edit, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SellerFormEdit(product: docs?[i] ?? {})));
                      }),
                      SizedBox(height: 0),
                      buildButtonWithIcon("Manage", Icons.settings, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Management(itemData: docs?[i] ?? {})));
                      }),
                      SizedBox(height: 0),
                      buildButtonWithIcon("Delete", Icons.delete, () {
                        final User? user = FirebaseAuth.instance.currentUser;
                        final String UserId = user?.uid ?? "";
                        final db = FirebaseFirestore.instance;
                        final p = db.collection("products");
                        // delete the document that has the same name as the product name and the same UserId as the user logged in
                        p.doc(UserId + "_" + docs?[i]["Product_name"]).delete();
                        setState(() {
                          docs?.removeAt(i);
                        });
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ]
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
