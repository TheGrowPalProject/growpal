import 'package:flutter/material.dart';

class SelectSociety extends StatefulWidget {
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
            SizedBox(height: 20),
            Text(
              'Select Society',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 200),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Select City',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(32, 31, 38, 1.0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: selectedCity,
                          dropdownColor: Color.fromRGBO(32, 31, 38, 1.0),
                          hint: Text('Select City',
                              style: TextStyle(color: Colors.white)),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          items: cities.map((String city) {
                            return DropdownMenuItem<String>(
                              value: city,
                              child: Text(city,
                                  style: TextStyle(color: Colors.white)),
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
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Select Society',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(32, 31, 38, 1.0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: selectedSociety,
                          dropdownColor: Color.fromRGBO(32, 31, 38, 1.0),
                          hint: Text(
                            'Select Society',
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: InputDecoration(
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
                                style: TextStyle(color: Colors.white),
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
                  Spacer(),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(32, 31, 38, 1.0),
              ),
              onPressed: () {
                // Handle button action
              },
              child: Text(
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
