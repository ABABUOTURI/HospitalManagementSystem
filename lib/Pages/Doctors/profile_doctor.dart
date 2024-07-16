import 'package:flutter/material.dart';

class ProfileDoctor extends StatefulWidget {
  @override
  _ProfileDoctorState createState() => _ProfileDoctorState();
}

class _ProfileDoctorState extends State<ProfileDoctor> {
  String _userName = 'Dr.Legend Emmanuel';
  String _userEmail = 'legendemmanuel@example.com';
  String _hospitalId = 'KB12345'; // Example hospital ID for the doctor

  TextEditingController _emailController = TextEditingController();
  TextEditingController _hospitalIdController = TextEditingController();

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _emailController.text = _userEmail;
    _hospitalIdController.text = _hospitalId;
  }

  void _saveProfile() {
    setState(() {
      _userEmail = _emailController.text;
      _hospitalId = _hospitalIdController.text;
      _isEditing = false;
    });

    if (_hospitalId.isEmpty) {
      _enterHospitalID();
    } else {
      _showProfileSavedDialog();
    }
  }

  void _editProfile() {
    setState(() {
      _isEditing = true;
    });
  }

  void _enterHospitalID() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Hospital ID'),
          content: TextField(
            controller: _hospitalIdController,
            onChanged: (value) {
              _hospitalId = value;
            },
            decoration: InputDecoration(hintText: 'Hospital ID'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
                _showProfileSavedDialog();
              },
            ),
          ],
        );
      },
    );
  }

  void _showProfileSavedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Profile Updated'),
          content: Text('Your profile information has been updated.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Doctor's Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF5518FC), // App bar background color
      ),
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
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Icon(
                Icons.person,
                size: 70,
                color: Colors.white,
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
                    SizedBox(height: 120), // Adjust height to fit the icon
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
                              '$_userName\'s Profile',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              enabled: _isEditing,
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email),
                                suffixIcon: _isEditing
                                    ? IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {},
                                      )
                                    : null,
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(height: 10),
                            TextFormField(
                              enabled: false,
                              initialValue: 'Hospital ID: $_hospitalId',
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.home),
                                suffixIcon: _isEditing
                                    ? IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          _enterHospitalID();
                                        },
                                      )
                                    : null,
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                _isEditing ? _saveProfile() : _editProfile();
                              },
                              child: Text(
                                _isEditing ? 'Save' : 'Edit Profile',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF5518FC), // Purple color
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                textStyle: TextStyle(fontSize: 18),
                              ),
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
