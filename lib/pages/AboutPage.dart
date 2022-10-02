import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';

import '../widgets/AboutAppBar.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: ListView(
        children: [
          AboutAppBar(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset("images/logo.png", height: 300),
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 48,
                          bottom: 15),

                      child: Text(
                            "What Are We",
                            style: TextStyle(
                              fontSize: 28,
                              color: Color(0xFF4C53A5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "We are a start up that aim to help small scale sellers in apartment societies sell their products. If you live in an apartment society, you would have seen small scale sellers who sell cooked food, accessories, baked goods, tupperware goods, etc. The primary source for advertisement for these informal sellers is through WhatsApp groups - whcih gets spammy after a while and isn't effective at all. We aim to fill in this gap and provide a platform to buy and sell locally, and informally without the need for any legal registrations.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),


    );;
  }
}
