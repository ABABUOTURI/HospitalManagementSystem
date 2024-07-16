import 'package:flutter/material.dart';

class PatientDashboard extends StatelessWidget {
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
        title: Text('Patient Dashboard',
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
              title: 'Find Doctor',
              icon: Icons.search,
              onTap: () {
                Navigator.pushNamed(context, '/finddoctorpage');
              },
            ),
            DashboardItem(
              title: 'Submit Query',
              icon: Icons.chat,
              onTap: () {
                Navigator.pushNamed(context, '/submitquerypage');
              },
            ),
            DashboardItem(
              title: 'View Responses',
              icon: Icons.message,
              isNew: true, // Example: Highlight this card
              onTap: () {
                Navigator.pushNamed(context, '/viewresponsespage');
              },
            ),
            DashboardItem(
              title: 'Profile Information',
              icon: Icons.account_circle,
              onTap: () {
                Navigator.pushNamed(context, '/profilepage');
              },
            ),
            /*DashboardItem(
              title: 'Notifications',
              icon: Icons.notifications,
              isNew: true, // Example: Highlight this card
              onTap: () {
                // Navigate to Notifications page
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
                '1',
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

