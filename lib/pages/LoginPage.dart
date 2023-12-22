import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:growpal/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const LoginPage());
}

var flag = 0;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> login() async {
      try {
        await GoogleSignIn().signOut();
        final GoogleSignInAccount? gAcc = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? authDetails =
            await gAcc?.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: authDetails?.accessToken,
          idToken: authDetails?.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        flag = 1;
      } on FirebaseAuthException catch (e){
        print('Failed with error code: ${e.code}');
        print(e.message);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'User Not Found!',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.red,
            duration: const Duration(
              seconds: 1,
              microseconds: 500,
            ),
            action: SnackBarAction(
              label: 'TRY AGAIN',
              onPressed: () {},
            ),
          ),
        );
      }
      if (flag == 1) {
        const success = SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 200.0,
          content: Text(
            "Success!",
            style: TextStyle(
              color: Colors.green,
              fontSize: 14.0,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white,
          duration: Duration(seconds: 1, milliseconds: 500),
        );

        ScaffoldMessenger.of(context).showSnackBar(success);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        var society = prefs.getString('society');
        var houseNumber = prefs.getString('houseNumber');
        var city = prefs.getString('city');
        if (society == null || houseNumber == null || city == null) {
          Navigator.pushNamed(context, 'SelectIntroScreen');
        } else {
          Navigator.pushNamed(context, 'HomePage');
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "GrowPal",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 26, 26, 26)),
                      child: Text(
                        "Login",
                        style: GoogleFonts.robotoSerif(fontSize: 20.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'SelectIntroScreen');
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 26, 26, 26)),
                      child: Text("Register",
                          style: GoogleFonts.robotoSerif(fontSize: 20.0)),
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
