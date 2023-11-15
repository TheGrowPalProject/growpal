import 'dart:js';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:growpal_hackathon/pages/CartPage.dart';
import 'package:growpal_hackathon/pages/Chekout.dart';
import 'package:growpal_hackathon/pages/ConfirmationPage.dart';
import 'package:growpal_hackathon/pages/HomePage.dart';
import 'package:growpal_hackathon/pages/ProdPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

//function to be implemented on the login page, currently a test page is created

Future<void> login() async {
  try {
    final GoogleSignInAccount? g_acc = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? auth_details =
        await g_acc?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: auth_details?.accessToken,
      idToken: auth_details?.idToken,
    );
    final uc = await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.push(
      context as BuildContext,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  } on FirebaseAuthException catch (e) {
    debugPrint("\n\nError in Login \n\n");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter FlatButton Example'),
          ),
          body: Center(
              child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.all(25),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: login,
                      child: const Text("login"),
                    )
                  ],
                )),
          ]))),
    );
  }
}
