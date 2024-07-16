import 'package:flutter/material.dart';

enum UserType { Patient, Doctor }

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _idNo = '';

  void _register(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select User Type'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _saveUserDetails(UserType.Patient);
                  },
                  child: Text('Patient'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _saveUserDetails(UserType.Doctor);
                  },
                  child: Text('Doctor'),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  void _saveUserDetails(UserType userType) {
    // Simulate saving user details based on selected userType
    if (userType == UserType.Patient) {
      // Save patient details
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Patient Registration'),
            content: Text('Patient registered successfully!'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigate to patient home or perform other actions
                },
              ),
            ],
          );
        },
      );
    } else if (userType == UserType.Doctor) {
      // Save doctor details
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Doctor Registration'),
            content: Text('Doctor registered successfully!'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigate to doctor home or perform other actions
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF5518FC),
                  Color(0xFF5518FC).withOpacity(0.8), // 80% purple
                  Color(0xFF87CEEB), // Sky blue color
                ],
                stops: [0.0, 0.8, 1.0], // Set the percentage stops for the gradient
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Secure Registration',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Registration',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _email = value;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _password = value;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'ID Number',
                                prefixIcon: Icon(Icons.perm_identity),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your ID number';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _idNo = value;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () => _register(context),
                              child: Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF5518FC), // Purple color
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                textStyle: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/loginpage');
                              },
                              child: Text("Already have An Account? Login"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
