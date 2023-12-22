/*
Welcome to my spaghetti code :)
 */
import 'package:growpal_hackathon/pages/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:growpal_hackathon/pages/CartPage.dart';
import 'package:growpal_hackathon/pages/Chekout.dart';
import 'package:growpal_hackathon/pages/ConfirmationPage.dart';
import 'package:growpal_hackathon/pages/HomePage.dart';
import 'package:growpal_hackathon/pages/ProdPage.dart';
import 'package:growpal_hackathon/pages/LoginPage.dart';
import 'package:growpal_hackathon/pages/BuyerIntro.dart';
import 'package:growpal_hackathon/pages/SellerIntro.dart';
import 'package:growpal_hackathon/pages/SelectIntro.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:growpal_hackathon/firebase_options.dart';
import 'package:growpal_hackathon/pages/SelectSocietyPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:growpal_hackathon/pages/YourOrdersPage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  User? user = FirebaseAuth.instance.currentUser;
  runApp(MyApp(
    initialRoute: user==null ? "LoginPage" : "/",
  ));
}

class MyApp extends StatefulWidget {
  final String? initialRoute;
  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {


      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      initialRoute: widget.initialRoute,
      routes: {
        "/": (context) => const HomePage(),
        "LoginPage": (context) => const LoginPage(),
        "SelectIntroScreen": (context) => const SelectIntroScreen(),
        "SellerIntroScreen": (context) => const SellerIntroScreen(),
        "BuyerIntroScreen": (context) => const BuyerIntroScreen(),
        "SelectSocietyPage": (context) => const SelectSociety(),
        "HomePage": (context) => const HomePage(),
        "cartPage": (context) => const CartPage(),
        "prodPage": (context) => const ProdPage(),
        "checkout": (context) => const Checkout(),
        "confirmation": (context) => const ConfirmationPage(),
      },
    );
  }
}
