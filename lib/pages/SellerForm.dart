import 'dart:io';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:growpal_hackathon/pages/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class SellerForm extends StatefulWidget {
  const SellerForm({super.key});

  @override
  _SellerFormState createState() => _SellerFormState();
}

class _SellerFormState extends State<SellerForm> {
  final _formKey = GlobalKey<FormState>();
  final pname = TextEditingController();
  final desc = TextEditingController();
  final price = TextEditingController();

  String _productName = '';
  var imgup = 0;
  XFile? file;
  String _description = '';
  String _price = '';
  String _userid = '';
  String ts = '';
  String imgurl = '';
  String date = '';
  DateTime _chosenDate = DateTime.now(); // Initialize chosen date
  bool? _isSubscription = false;

  void _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      // Save the form data
      _productName = pname.text;
      _description = desc.text;
      _price = price.text;
      debugPrint(
          'I - \n\n $_productName, $_price, $_description, $_isSubscription, $imgup\n\n');
      var _date = _chosenDate.toString();
      if (_productName == '' ||
          _description == '' ||
          _price == '' ||
          imgup != 1) {
        const err = SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 200.0,
          content: Text(
            "Error Try Again!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1, milliseconds: 500),
        );

        ScaffoldMessenger.of(context).showSnackBar(err);
      } else {
        var uid = FirebaseAuth.instance.currentUser!.uid;
        _userid = uid;
        var db = FirebaseFirestore.instance;

        Reference refroot = FirebaseStorage.instance.ref();
        debugPrint('Form File Path: ${File(file!.path).toString()} \n');
        Reference pimg = refroot.child('products');
        Reference imgup = pimg.child('${ts}.jpg');

        try {
          await imgup.putFile(File(file!.path));
          imgurl = await imgup.getDownloadURL();
        } catch (e) {
          debugPrint('Error: $e');
        }

        final product = <String, dynamic>{
          'Product_name': _productName,
          'Description': _description,
          'Price': _price,
          'Subscription': _isSubscription,
          'Userid': _userid,
          'Image': imgurl,
          'Date': _date
        };

        try {
          db
              .collection('products')
              .doc('${_userid}_$_productName')
              .set(product);
          debugPrint('Added ID: $_userid\n');
          print(product);
          const suc_up = SnackBar(
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            width: 200.0,
            content: Text(
              "Product Details Uploaded!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1, milliseconds: 500),
          );
          ScaffoldMessenger.of(context).showSnackBar(suc_up);
        } catch (e) {
          debugPrint("Error: $e");
        }
      }
    }
  }

  Future<void> _getImg() async {
    ts = DateTime.now().millisecondsSinceEpoch.toString();
    ImagePicker ip = ImagePicker();
    file = await ip.pickImage(source: ImageSource.gallery);
    debugPrint(' Button File Path: ${File(file!.path).toString()} \n');
    imgup = 1;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('GrowPal',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      )),
                  const Text(
                    'Product Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: pname,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 26, 26, 26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 42, 42, 42),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 42, 42, 42)),
                      ),
                      hintText: 'Enter Product Name',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 100, 100, 100)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _productName = value;
                      });
                    },
                  ),

                  const SizedBox(height: 16.0),

                  const Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    maxLines: 5,
                    controller: desc,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 26, 26, 26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 42, 42, 42),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 42, 42, 42)),
                      ),
                      hintText: 'Enter Product Description',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 100, 100, 100)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                  ),

                  const SizedBox(height: 16.0),

                  const Text(
                    'Add Images',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 26, 26, 26)),
                        onPressed: _getImg,
                        child: const Text(
                          'Device',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        'Google Drive',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'OneDrive',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16.0),

                  const Text(
                    'Price',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    controller: price,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 26, 26, 26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 42, 42, 42),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 42, 42, 42)),
                      ),
                      hintText: 'Enter Price',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 100, 100, 100)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _price = value;
                      });
                    },
                  ),

                  const SizedBox(height: 16.0),

                  const Text(
                    'Choose a Date',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Use the `flutter_datetime_picker` package to create a date picker
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 26, 26, 26)),
                      ),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: _chosenDate,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 31)),
                        ).then((date) {
                          if (date != null) {
                            setState(() {
                              _chosenDate = date;
                            });
                          }
                        });
                      },
                      child: const Text(
                        'Select Date',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Text(
                    'Selected Date: $_chosenDate',
                    style: const TextStyle(color: Colors.white),
                  ),

                  const SizedBox(height: 16.0),

                  CheckboxListTile(
                    title: const Text(
                      'Is Subscription',
                      style: TextStyle(color: Colors.white),
                    ),
                    fillColor: MaterialStateProperty.resolveWith((states) {
                      if (!states.contains(MaterialState.selected)) {
                        return Color.fromARGB(255, 45, 45, 45);
                      }
                      return null;
                    }),
                    checkColor: Colors.white,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _isSubscription,
                    onChanged: (value) {
                      setState(() {
                        _isSubscription = value;
                      });
                    },
                  ),

                  const SizedBox(height: 1.0),

                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 26, 26, 26)),
                      ),
                      onPressed: _onSubmit,
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
