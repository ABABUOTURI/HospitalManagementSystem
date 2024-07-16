import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
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
        title: Text('Admin Dashboard',
        style: TextStyle(color: Colors.white), 
        ),
        backgroundColor: Color(0xFF5518FC),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: <Widget>[
            DashboardItem(
              title: 'Manage Users',
              icon: Icons.people,
              onTap: () {
                Navigator.pushNamed(context, '/manageUsers');
              },
            ),
            DashboardItem(
              title: 'Manage Doctors',
              icon: Icons.medical_services,
              onTap: () {
                Navigator.pushNamed(context, '/manageDoctors');
              },
            ),
            DashboardItem(
              title: 'Manage Patients',
              icon: Icons.person,
              onTap: () {
                Navigator.pushNamed(context, '/managePatients');
              },
            ),
            DashboardItem(
              title: 'View Appointments',
              icon: Icons.calendar_today,
              onTap: () {
                Navigator.pushNamed(context, '/viewAppointments');
              },
            ),
            DashboardItem(
              title: 'Generate Reports',
              icon: Icons.analytics,
              onTap: () {
                Navigator.pushNamed(context, '/generateReports');
              },
            ),
            DashboardItem(
              title: 'System Settings',
              icon: Icons.settings,
              onTap: () {
                Navigator.pushNamed(context, '/systemSettings');
              },
            ),
            DashboardItem(
              title: 'Notifications',
              icon: Icons.notifications,
              onTap: () {
                Navigator.pushNamed(context, '/notifications');
              },
            ),
            DashboardItem(
              title: 'Audit Logs',
              icon: Icons.history,
              onTap: () {
                Navigator.pushNamed(context, '/auditLogs');
              },
            ),
            DashboardItem(
              title: 'Feedback and Support',
              icon: Icons.feedback,
              onTap: () {
                Navigator.pushNamed(context, '/feedbackSupport');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  const DashboardItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50),
            SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
