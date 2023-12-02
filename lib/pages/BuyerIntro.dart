import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class BuyerIntroScreen extends StatelessWidget {
  const BuyerIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black, // Set the background color of Scaffold to black
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "How it Works",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white), // Set text color to white
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 5),
                    SizedBox(
                      width: 200,
                      child: Text(
                        "1. You will see products that other people in your society are selling.",
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.robotoSerif(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),  // Set text color to white
                      ),
                    ),
                    Image.asset(
                      "images/buyerintro.png",
                      height: 250,
                    ),
                    SizedBox(
                      height: 300,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Center(
                                child: Padding(
                                  padding:EdgeInsets.all(5.0),
                                  child:Container(
                                    width: 210,
                                    height: 450,
                                    child: Text(
                                      "2. Some items are only available to order during a certain time.  Some items might have subscriptions. This is mainly for food products and other consumables.\n\n3. When you order, it is up to the seller and you, the buyer to negotiate the mode of delivery. We do not handle deliveries yet.",
                                      maxLines: 30,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.robotoSerif(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16), // Set text color to white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle the action when the button is pressed
                },
                child: Text("OKAY"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(190, 40),
                  backgroundColor: Color.fromARGB(255,60,60,60), // Change button background color to white
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)
                ),
              ),
            ),
            SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
