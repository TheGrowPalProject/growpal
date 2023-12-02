import 'package:flutter/material.dart';

class SellerForm extends StatefulWidget {
  const SellerForm({super.key});

  @override
  _SellerFormState createState() => _SellerFormState();
}

class _SellerFormState extends State<SellerForm> {
  final _formKey = GlobalKey<FormState>();

  String _productName = '';
  String _description = '';
  String _price = '';
  DateTime _chosenDate = DateTime.now(); // Initialize chosen date
  bool? _isSubscription = false;

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      // Save the form data
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('GrowPal',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      )),
                  const Text(
                    'Product Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 26, 26, 26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color:  Color.fromARGB(255, 42, 42, 42),
                        ),

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 42, 42, 42)),
                      ),
                      hintText: 'Enter Product Name',
                      hintStyle: const TextStyle(color: Color.fromARGB(255, 100, 100, 100)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _productName = value;
                      });
                    },
                  ),

                  const SizedBox(height: 16.0),

                  const Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 26, 26, 26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color:  Color.fromARGB(255, 42, 42, 42),
                        ),

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 42, 42, 42)),
                      ),
                      hintText: 'Enter Product Name',
                      hintStyle: const TextStyle(color: Color.fromARGB(255, 100, 100, 100)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                  ),

                  const SizedBox(height: 16.0),

                  const Text(
                    'Add Images',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Browse From this Device',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Google Drive',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'OneDrive',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16.0),

                  const Text(
                    'Price',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                                        decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 26, 26, 26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 42, 42, 42),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 42, 42, 42)),
                      ),
                      hintText: 'Enter Product Name',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 100, 100, 100)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _price = value;
                      });
                    },
                  ),

                  const SizedBox(height: 16.0),

                  const Text(
                    'Choose a Date',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Use the `flutter_datetime_picker` package to create a date picker
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 26, 26, 26)),
                      ),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: _chosenDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 31)),
                          
                        ).then((date) {
                          if (date != null) {
                            setState(() {
                              _chosenDate = date;
                            });
                          }
                        });
                      },
                      
                      child: const Text('Select Date', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Text(
                    'Selected Date: $_chosenDate',
                    style: const TextStyle(color: Colors.white),
                  ),

                  const SizedBox(height: 16.0),

                  CheckboxListTile(
                    title: const Text(
                      'Is Subscription',
                      style: TextStyle(color: Colors.white),
                    ),
                    fillColor: MaterialStateProperty.resolveWith((states) {
                      if (!states.contains(MaterialState.selected)) {
                        return Color.fromARGB(255, 45, 45, 45);
                      }
                      return null;
                    }),
                    checkColor: Colors.white,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _isSubscription,
                    onChanged: (value) {
                      setState(() {
                        _isSubscription = value;
                      });
                    },
                  ),

                  const SizedBox(height: 16.0),

                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 26, 26, 26)),
                      ),
                      onPressed: _onSubmit,
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
