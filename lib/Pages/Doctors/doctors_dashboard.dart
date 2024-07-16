import 'package:flutter/material.dart';

class DoctorsDashboard extends StatelessWidget {
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
          "Doctor's Dashboard",
          style: TextStyle(
            color: Colors.white,
          ),
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
              title: 'View Complaints',
              icon: Icons.view_list,
              onTap: () {
                Navigator.pushNamed(context, '/viewcomplain');
              },
            ),
            DashboardItem(
              title: 'Profile Information',
              icon: Icons.account_circle,
              onTap: () {
                Navigator.pushNamed(context, '/profiledoctor');
              },
            ),
            /*DashboardItem(
              title: 'Appointments',
              icon: Icons.calendar_today,
              onTap: () {
                Navigator.pushNamed(context, '/appointments');
              },
            ),*/
            /*DashboardItem(
              title: 'Query Responses',
              icon: Icons.message,
              onTap: () {
                Navigator.pushNamed(context, '/messaging');
              },
            ),*/
            /*DashboardItem(
              title: 'Analytics & Reports',
              icon: Icons.analytics,
              onTap: () {
                Navigator.pushNamed(context, '/analyticsreports');
              },
            ),*/
            DashboardItem(
              title: 'Settings',
              icon: Icons.settings,
              onTap: () {
                Navigator.pushNamed(context, '/settingspage');
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
  final bool isNew;

  const DashboardItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: isNew ? Color.fromARGB(255, 139, 175, 7) : null,
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50),
            SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center),
            if (isNew) ...[
              SizedBox(height: 5),
              Text(
                'New',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

