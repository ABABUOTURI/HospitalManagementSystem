import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class ViewComplain extends StatefulWidget {
  @override
  _ViewComplainState createState() => _ViewComplainState();
}

class _ViewComplainState extends State<ViewComplain> {
  final List<Complaint> complaints = [
    Complaint(
      id: 1,
      patientName: 'Legend Emmanuel',
      date: DateTime.now().subtract(Duration(days: 1, hours: 5)),
      detail: 'I have a severe headache and I\'m feeling nauseous.',
    ),
    Complaint(
      id: 2,
      patientName: 'Alex Nyakundi',
      date: DateTime.now().subtract(Duration(days: 2, hours: 3)),
      detail: 'I have a rash on my arm that won\'t go away.',
    ),
    Complaint(
      id: 3,
      patientName: 'Miriam Njoki',
      date: DateTime.now().subtract(Duration(days: 3, hours: 4)),
      detail: 'I am experiencing shortness of breath.',
    ),
    Complaint(
      id: 4,
      patientName: 'John Mwiti',
      date: DateTime.now().subtract(Duration(days: 4, hours: 2)),
      detail: 'I have a persistent cough.',
    ),
    Complaint(
      id: 5,
      patientName: 'Emily Azzez',
      date: DateTime.now().subtract(Duration(days: 5, hours: 1)),
      detail: 'I have a sharp pain in my back.',
    ),
    Complaint(
      id: 6,
      patientName: 'Michael Otieno',
      date: DateTime.now().subtract(Duration(days: 6, hours: 6)),
      detail: 'I am feeling very fatigued.',
    ),
    Complaint(
      id: 7,
      patientName: 'Sophia Wambui',
      date: DateTime.now().subtract(Duration(days: 7, hours: 7)),
      detail: 'I have a sore throat and fever.',
    ),
  ];

  TextEditingController _solutionController = TextEditingController();

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
          'Complaints List',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF5518FC),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(
                'Patient: ${complaints[index].patientName}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Complaint: ${complaints[index].detail}'),
                  Text('Date: ${DateFormat('yyyy-MM-dd – kk:mm').format(complaints[index].date)}'),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.reply, color: Color(0xFF5518FC)),
                onPressed: () {
                  _showSolutionDialog(context, complaints[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSolutionDialog(BuildContext context, Complaint complaint) {
    _solutionController.clear();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Provide Solution for ${complaint.patientName}'),
          content: TextField(
            controller: _solutionController,
            decoration: InputDecoration(
              labelText: 'Solution',
              border: OutlineInputBorder(),
            ),
            maxLines: 5,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                submitSolution(complaint);
                Navigator.of(context).pop();
              },
              child: Text('Submit',
              style: TextStyle(
            color: Colors.white,
          ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5518FC),
              ),
            ),
          ],
        );
      },
    );
  }

  void submitSolution(Complaint complaint) {
    String solutionText = _solutionController.text.trim();
    if (solutionText.isNotEmpty) {
      // Implement save solution functionality
      // For example, save to a database or send to a server
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Solution for ${complaint.patientName} submitted successfully')),
      );
      _solutionController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a solution before submitting')),
      );
    }
  }
}

class Complaint {
  final int id;
  final String patientName;
  final DateTime date;
  final String detail;

  Complaint({
    required this.id,
    required this.patientName,
    required this.date,
    required this.detail,
  });
}

void main() {
  runApp(MaterialApp(
    home: ViewComplain(),
  ));
}
