import 'package:flutter/material.dart';
import 'package:hospital_management_system/chat_page.dart';
import 'package:intl/intl.dart';


class ViewResponsesPage extends StatelessWidget {
  final List<Map<String, dynamic>> responses = [
    {
      'query': 'I have a headache that won\'t go away. What should I do?',
      'queryTime': DateTime.now().subtract(Duration(days: 2, hours: 3)),
      'response': 'Please visit the clinic for a detailed examination.',
      'responseTime': DateTime.now().subtract(Duration(days: 1, hours: 5)),
      'doctorName': 'Dr. John Smith',
      'specialization': 'Consultant Neurologist',
      'hospital': 'City Hospital'
    },
    {
      'query': 'What can I do to improve my sleep quality?',
      'queryTime': DateTime.now().subtract(Duration(days: 4, hours: 6)),
      'response': 'Avoid caffeine and electronics before bedtime. Practice relaxation techniques.',
      'responseTime': DateTime.now().subtract(Duration(days: 3, hours: 2)),
      'doctorName': 'Dr. Emily Johnson',
      'specialization': 'Consultant Sleep Specialist',
      'hospital': 'General Hospital'
    },
    // Additional responses can be added here
  ];

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
          'View Responses',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF5518FC),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Doctor Responses',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: responses.length,
                itemBuilder: (context, index) {
                  final response = responses[index];
                  final queryTime = DateFormat('MMM dd, yyyy – h:mm a').format(response['queryTime']);
                  final responseTime = DateFormat('MMM dd, yyyy – h:mm a').format(response['responseTime']);

                  return Card(
                    elevation: 5.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Your Query:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            response['query'],
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Submitted on: $queryTime',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Doctor\'s Response:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            response['response'],
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Responded on: $responseTime',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Doctor: ${response['doctorName']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Specialization: ${response['specialization']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Hospital: ${response['hospital']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatPage(),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.message,
                              size: 30,
                              color: Color.fromARGB(255, 38, 5, 92),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ViewResponsesPage(),
  ));
}
