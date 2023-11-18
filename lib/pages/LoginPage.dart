import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "GrowPal",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.white
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'HomePage');
                      },
                      child: Text("Login",style: GoogleFonts.robotoSerif(fontSize: 20.0),),
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Color.fromARGB(255, 26, 26, 26)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'HomePage');
                      },
                      child: Text("Register",style: GoogleFonts.robotoSerif(fontSize: 20.0)),
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Color.fromARGB(255, 26, 26, 26)
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
