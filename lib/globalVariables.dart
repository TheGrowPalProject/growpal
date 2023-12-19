import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class globalVariables {
  var quantities = [1, 1, 1, 1, 1, 1, 1];
  var titles = [
    "Hand Bag",
    "Earring",
    "Tupperware Box",
    "Black Forest Cake",
    "Strawberry Cupcake",
    "Stone",
    "Cable Protectors",
    "Bottle",
    "Phone Case",
    "Stickers",
    "Papads"
  ];
  var prices = [999, 199, 499, 99, 599, 299, 49, 49];
  var price = 2792;
  var desc = [
    "Eggless-100% Veg",
    "Eggless-100% Veg",
    "Handmade",
    "Make your cables last long",
    "The Bottle to buy. Period.",
    "Give your phone some clothes",
    "Make your room look like heaven",
    "Crispy And Spicy, Hotter than your ex",
  ];
  var discounts = ["26", "27", "28", "29", "30", "31", "85", "5"];
  var checkoutPermit = true;
}

class ObjectService {
  ObjectService() {
    debugPrint("ObjectSerevice Called\n");
  }
  FirebaseFirestore? _instance;
  List<Object> _objects = [];
  List images = [];
  List<Object> getobj() {
    return _objects;
  }

  List<dynamic> getimages() {
    return images;
  }

  Future<void> getimg() async {
    for (var j in _objects) {
      final pimg =
          FirebaseStorage.instance.ref().child('products').child('${j.Image}');
      var loc = await pimg.getDownloadURL();
      print("Image Link in func: $loc");
      images.add(loc);
    }
  }

  Future<void> getdata() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference cat = _instance!.collection("products");
    QuerySnapshot snapshot = await cat.get();
    var data = snapshot.docs.map((doc) => doc.data()).toList();
    for (var ele in data) {
      _objects.add(Object.fromObject(ele));
    }
  }
}

class Object {
  String? Description;
  String? Userid;
  String? Price;
  String? Product_name;
  String? Image;
  String? Date;
  bool? Subscription;
  Object({
    this.Product_name,
    this.Userid,
    this.Description,
    this.Price,
    this.Image,
    this.Date,
    this.Subscription,
  });
  factory Object.fromObject(d) {
    return Object(
      Product_name: d['Product_name'],
      Userid: d['Userid'],
      Price: d['Price'],
      Description: d['Description'],
      Image: d['Image'],
      Date: d['Date'],
      Subscription: d['Subscription'],
    );
  }
}
