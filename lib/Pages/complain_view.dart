import 'package:flutter/material.dart';

class ComplainView extends StatelessWidget {
  final int complaintId;

  const ComplainView   ({required this.complaintId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint Details'),
        backgroundColor: Color(0xFF5518FC),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Complaint #$complaintId',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Details of the complaint...',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Solution',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement save solution functionality
              },
              child: Text('Submit Solution'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5518FC),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
