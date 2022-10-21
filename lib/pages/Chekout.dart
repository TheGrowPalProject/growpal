
//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tts/flutter_tts.dart';

class Checkout extends StatefulWidget {
  Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  FlutterTts flutterTts = FlutterTts();
  
  
  
   

 void _play()
 {
     flutterTts.setLanguage("en-US");
    flutterTts.setPitch(1);
    flutterTts.speak("Thank you for shopping with us");
}
  

  @override
  Widget build(BuildContext context) {
    _play();
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Thank You For \nShopping With Us!",
                style: TextStyle(
                  color: Color(0xFF4C53A5),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Your Order Has Been Forwarded To The Seller",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, right: 25, left: 25),
            child: Text(
              "Seller Details:                                           ",
              style: TextStyle(
                color: Color(0xFF4C53A5),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Name: John Doe \nEmail: john.doe@growpal.com \nPhone: 1234567890 \nHouse Number: B003",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/");
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF4C53A5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Go Home",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Checkout extends StatefulWidget {
//   const Checkout({Key? key}) : super(key: key);

//   @override
//   State<Checkout> createState() => _CheckoutState();
// }

// class _CheckoutState extends State<Checkout> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [SafeArea(
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Text(
//                 "Thank You For \nShopping With Us!",
//               style: TextStyle(
//                 color: Color(0xFF4C53A5),
//                 fontSize: 50,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),

//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 25),
//             child: Text(
//                 "Your Order Has Been Forwarded To The Seller",
//               style: TextStyle(
//                 color: Colors.grey[700],
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,


//               ),
//             ),
//           ),


//           Padding(
//             padding: EdgeInsets.only(top: 20, right: 25, left: 25),
//             child: Text(
//               "Seller Details:                                           ",
//               style: TextStyle(
//                 color: Color(0xFF4C53A5),
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,


//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 25),
//             child: Text(
//               "Name: John Doe \nEmail: john.doe@growpal.com \nPhone: 1234567890 \nHouse Number: B003",
//               textAlign: TextAlign.left,
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,


//               ),
//             ),
//           ),


//     ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//           height: 80,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               InkWell(
//                 onTap: () {
//                   Navigator.pushNamed(context, "/");
//                 },
//                 child: Container(
//                     alignment: Alignment.center,
//                     height: 50,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Color(0xFF4C53A5),
//                       borderRadius: BorderRadius.circular(20),

//                     ),
//                     child: Text(
//                       "Go Home",
//                       style: TextStyle(
//                         fontSize: 26,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     )
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );

//   }
// }
