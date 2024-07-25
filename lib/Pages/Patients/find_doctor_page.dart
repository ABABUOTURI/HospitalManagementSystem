import 'package:flutter/material.dart';
import 'package:hospital_management_system/Pages/Patients/submit_query_page.dart';

class Doctor {
  final String name;
  final String specialization;
  final String hospital;

  Doctor({
    required this.name,
    required this.specialization,
    required this.hospital,
  });
}

class FindDoctorPage extends StatefulWidget {
  @override
  _FindDoctorPageState createState() => _FindDoctorPageState();
}

class _FindDoctorPageState extends State<FindDoctorPage> {
  TextEditingController _searchController = TextEditingController();
  List<Doctor> doctors = [
    Doctor(name: 'Dr. John Smith', specialization: 'Neurologist', hospital: 'City Hospital'),
    Doctor(name: 'Dr. Emily Johnson', specialization: 'Sleep Specialist', hospital: 'General Hospital'),
    Doctor(name: 'Dr. Legend', specialization: 'Cardiologist', hospital: 'Central Hospital'),
    Doctor(name: 'Dr. Emmanuel', specialization: 'Dermatologist', hospital: 'Regional Hospital'),
    Doctor(name: 'Dr. Jones', specialization: 'Pediatrician', hospital: 'Children\'s Hospital'),
    Doctor(name: 'Dr. Brenda', specialization: 'Orthopedic Surgeon', hospital: 'City Hospital'),
    Doctor(name: 'Dr. Ruth', specialization: 'Oncologist', hospital: 'General Hospital'),
  ];

  List<Doctor> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    filteredDoctors = doctors;
  }

  void _filterDoctors(String query) {
    List<Doctor> results = [];
    if (query.isEmpty) {
      results = doctors;
    } else {
      results = doctors
          .where((doctor) =>
              doctor.name.toLowerCase().contains(query.toLowerCase()) ||
              doctor.specialization.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredDoctors = results;
    });
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
          'Find Doctor',
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
            SizedBox(height: 20),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by name or specialty',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                _filterDoctors(query);
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubmitQueryPage(),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Doctor: ${doctor.name}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Specialization: ${doctor.specialization}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Hospital: ${doctor.hospital}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
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
