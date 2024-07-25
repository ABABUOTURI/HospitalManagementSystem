import 'package:flutter/material.dart';

class PatientDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF5518FC),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF5518FC),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Find Doctor'),
              onTap: () {
                Navigator.pushNamed(context, '/finddoctorpage');
              },
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Submit Query'),
              onTap: () {
                Navigator.pushNamed(context, '/submitquerypage');
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('View Responses'),
              onTap: () {
                Navigator.pushNamed(context, '/viewresponsespage');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile Information'),
              onTap: () {
                Navigator.pushNamed(context, '/profilepage');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settingspage');
              },
            ),
          ],
        ),
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
              isNew: true,
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
