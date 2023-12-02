import 'package:flutter/material.dart';
import 'package:growpal_hackathon/pages/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:growpal_hackathon/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
//function to be implemented on the login page, currently a test page is created

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
        final GoogleSignInAccount? g_acc = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? auth_details =
            await g_acc?.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: auth_details?.accessToken,
          idToken: auth_details?.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        await Future.delayed(const Duration(seconds: 1));
        flag = 1;
      } on FirebaseAuthException catch (e) {
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
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1, milliseconds: 500),
        );

        ScaffoldMessenger.of(context).showSnackBar(success);
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushNamed(context, 'HomePage');
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
