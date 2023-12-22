import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectSociety extends StatefulWidget {
  const SelectSociety({super.key});

  @override
  _SelectSocietyState createState() => _SelectSocietyState();
}

class _SelectSocietyState extends State<SelectSociety> {
  String? selectedCity;
  String? selectedSociety;
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

  @override
  Widget build(BuildContext context) {
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
                Navigator.pushNamed(context, "/");
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
