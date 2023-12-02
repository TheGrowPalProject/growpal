import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SellerIntroScreen extends StatelessWidget {
  const SellerIntroScreen({Key? key}) : super(key: key);

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
                    SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      child: Text(
                        "1.You post products in the selling section.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.robotoSerif(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16), // Set text color to white
                      ),
                    ),
                    Image.asset(
                      "images/sellerintro.png",
                      height: 300,
                    ),
                    SizedBox(
                      height: 530,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Center(
                                child: Padding(
                                  padding:EdgeInsets.all(3.0),
                                  child:Container(
                                    width: 210,
                                    height: 450,
                                    child: Text(
                                      "2. Whenever someone orders your product, you get a notification. You can define at what times you are taking in orders and what times you are not available.\n\n3.You can use our order tracking page to keep a track of incoming and delivered orders.",
                                      maxLines: 15,
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
                child: Text("SELL!"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(190, 40),
                  backgroundColor: Color.fromARGB(255,60,60,60), // Change button background color to white
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)
                ),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
