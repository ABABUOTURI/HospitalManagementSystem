import 'package:flutter/material.dart';

class SubmitQueryPage extends StatefulWidget {
  @override
  _SubmitQueryPageState createState() => _SubmitQueryPageState();
}

class _SubmitQueryPageState extends State<SubmitQueryPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _queryController = TextEditingController();

  void _submitQuery() {
    if (_formKey.currentState!.validate()) {
      // Process the query submission here
      _showQuerySubmittedDialog();
    }
  }

  void _showQuerySubmittedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Query Submitted'),
          content: Text('Your query has been submitted to the doctor.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                _queryController.clear();
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
          'Submit Query',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF5518FC),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Submit Your Query',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _queryController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Query',
                  hintText: 'Enter your query or complaint here',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your query';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitQuery,
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5518FC),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
