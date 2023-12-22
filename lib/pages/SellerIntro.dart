import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerIntroScreen extends StatelessWidget {
  const SellerIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            Colors.black, // Set the background color of Scaffold to black
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "How it Works",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white), // Set text color to white
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 30,
                      child: Text(
                        "1.You post products in the selling section.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.robotoSerif(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16), // Set text color to white
                      ),
                    ),
                    Image.asset(
                      "images/sellerintro.png",
                      width: double.infinity,
                      fit: BoxFit.cover,
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
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    "2. Whenever someone orders your product, you get a notification. You can define at what times you are taking in orders and what times you are not available.\n\n3.You can use our order tracking page to keep a track of incoming and delivered orders.",
                                    maxLines: 15,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.robotoSerif(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            16), // Set text color to white
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
                  Navigator.pushNamed(context, "SelectSocietyPage");
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(190, 40),
                    backgroundColor: const Color.fromARGB(255, 60, 60,
                        60), // Change button background color to white
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold)),
                child: const Text("SELL!"),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
