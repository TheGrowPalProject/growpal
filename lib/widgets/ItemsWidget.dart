import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import '../globalVariables.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:growpal_hackathon/pages/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';

List<Object> products = o.getobj();

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var images;
    Future<List> imageList() async {
      List images = [];
      for (var j in products) {
        final pimg = FirebaseStorage.instance
            .ref()
            .child('products')
            .child('${j.Image}');
        var loc = await pimg.getDownloadURL();
        images.add(loc);
      }
      return images;
    }

    images = imageList();

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 1, horizontal: products.length.toDouble()),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF10100F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: FutureBuilder(
          future: imageList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              images = snapshot.data;
              return MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GridView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) => Items(index, images)),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 2,
                    childAspectRatio: 1.6,
                  ),
                ),
              );
            } else {
              return const Text("Error");
            }
          }),
    );
  }
}

class Items extends StatelessWidget {
  final int index;
  final images;
  var sentindex;
  int i = 0;
  Items(this.index, this.images, {super.key});

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        for (i; i < index; i++)
          Container(
            padding: EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
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
                const SizedBox(
                  height: 8.0,
                ),
                InkWell(
                  onTap: () {
                    sentindex = i;

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
                                    "${products[i].Product_name}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Text("${products[i].Description}"),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.all(0),
                              height: 130,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  images[i],
                                  height: 140,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      i.isEven
                          ? Container(
                              margin: EdgeInsets.all(10),
                              height: 130,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  images[i],
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
                                    "${products[i].Product_name}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "${products[i].Description}",
                                    style: TextStyle(
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
    ));
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
