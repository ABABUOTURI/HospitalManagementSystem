import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  String _theme = 'Light';

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
        title: Text('Settings',
         style: TextStyle(
                        color: Colors.white,
                      ),
        ),
        backgroundColor: Color(0xFF5518FC),
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
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
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
                              'Application Settings',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            SwitchListTile(
                              title: Text('Enable Notifications'),
                              value: _notificationsEnabled,
                              onChanged: (bool value) {
                                setState(() {
                                  _notificationsEnabled = value;
                                });
                              },
                            ),
                            SizedBox(height: 10),
                            ListTile(
                              title: Text('Theme'),
                              trailing: DropdownButton<String>(
                                value: _theme,
                                items: <String>['Light', 'Dark']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _theme = newValue!;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Save settings action
                                _showSettingsSavedDialog();
                              },
                              child: Text(
                                'Save Settings',
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

  void _showSettingsSavedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Settings Updated'),
          content: Text('Your settings have been saved.'),
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
}
