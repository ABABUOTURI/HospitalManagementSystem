import 'package:flutter/material.dart';
import 'package:hospital_management_system/Pages/Admin/user.dart';

class ManageUsersPage extends StatefulWidget {
  @override
  _ManageUsersPageState createState() => _ManageUsersPageState();
}

class _ManageUsersPageState extends State<ManageUsersPage> {
  List<User> users = []; // Example list of users, initially empty

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
        title: Text('Manage Users',
        style: TextStyle(color: Colors.white), 
        ),
        backgroundColor: Color(0xFF5518FC), // Example app bar color
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          User user = users[index];
          return ListTile(
            title: Text(user.id),
            subtitle: Text(user.password),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  users.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddUserDialog(context);
        },
        child: Icon(Icons.add,color: Colors.white,
        ),
        backgroundColor: Color(0xFF5518FC), // Example button color
      ),
    );
  }

  void _showAddUserDialog(BuildContext context) {
    String id = '';
    String password = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               TextField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) {
                  id = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'User ID'),
                onChanged: (value) {
                  id = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                onChanged: (value) {
                  password = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel',
              style: TextStyle(color: Colors.white), 
              ),
               style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF5518FC), // Background color as #5518FC
                                ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add',
              style: TextStyle(color: Colors.white), 
              ),
               style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF5518FC), // Background color as #5518FC
                                ),
              onPressed: () {
                setState(() {
                  users.add(User(id: id, password: password));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
