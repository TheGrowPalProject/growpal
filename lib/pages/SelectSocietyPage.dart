import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SelectSociety extends StatefulWidget {
  const SelectSociety({super.key});

  @override
  _SelectSocietyState createState() => _SelectSocietyState();
}

class _SelectSocietyState extends State<SelectSociety> {
  String? selectedCity;
  String? selectedSociety;
  String? selectedHouseNumber;
  final List<String> cities = [
    'City 1',
    'City 2',
    'City 3'
  ]; // Replace with city data
  final List<String> societies = [
    'Society A',
    'Society B',
    'Society C'
  ]; // Replace with society data
  final List<String> houseNumber = [
    'House 1',
    'House 2',
    'House 3'
  ]; // Replace with society data



  @override
  Widget build(BuildContext context) {
    var flag = 0;
    Future<void> login() async {
      try {
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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Select Society',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 200),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Select City',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(32, 31, 38, 1.0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: selectedCity,
                          dropdownColor: const Color.fromRGBO(32, 31, 38, 1.0),
                          hint: const Text('Select City',
                              style: TextStyle(color: Colors.white)),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          items: cities.map((String city) {
                            return DropdownMenuItem<String>(
                              value: city,
                              child: Text(city,
                                  style: const TextStyle(color: Colors.white)),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            selectedCity = value;
                            // Handle city selection
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Select Society',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(32, 31, 38, 1.0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: selectedSociety,
                          dropdownColor: const Color.fromRGBO(32, 31, 38, 1.0),
                          hint: const Text(
                            'Select Society',
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          items: societies.map((String society) {
                            return DropdownMenuItem<String>(
                              value: society,
                              child: Text(
                                society,
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            selectedSociety = value;
                            // Handle society selection
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'House Number',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(32, 31, 38, 1.0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: selectedHouseNumber,
                          dropdownColor: const Color.fromRGBO(32, 31, 38, 1.0),
                          hint: const Text(
                            'Select House Number',
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          items: societies.map((String houseNumber) {
                            return DropdownMenuItem<String>(
                              value: houseNumber,
                              child: Text(
                                houseNumber,
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            selectedHouseNumber = value;
                            // Handle society selection
                          },
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(32, 31, 38, 1.0),
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setString('city', selectedCity!);
                prefs.setString('society', selectedSociety!);
                prefs.setString('houseNumber', selectedHouseNumber!);
                login();
              },
              child: const Text(
                'OKAY!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
