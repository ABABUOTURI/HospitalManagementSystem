import 'package:flutter/material.dart';
import 'package:hospital_management_system/Pages/Admin/admin_dashboard.dart';
import 'package:hospital_management_system/Pages/Admin/manage_users_page.dart';
import 'package:hospital_management_system/Pages/Doctors/doctors_dashboard.dart';
import 'package:hospital_management_system/Pages/Doctors/profile_doctor.dart';
import 'package:hospital_management_system/Pages/Doctors/view_complain.dart';
import 'package:hospital_management_system/Pages/Patients/find_doctor_page.dart';
import 'package:hospital_management_system/Pages/Patients/login_page.dart';
import 'package:hospital_management_system/Pages/Patients/patient_dashboard.dart';
import 'package:hospital_management_system/Pages/Patients/registration_page.dart';
import 'package:hospital_management_system/Pages/Patients/submit_query_page.dart';
import 'package:hospital_management_system/Pages/Patients/view_responses_page.dart';
//import 'package:hospital_management_system/Pages/home_page.dart';
import 'package:hospital_management_system/Pages/Patients/profile_page.dart';
import 'package:hospital_management_system/Pages/home_page.dart';
import 'package:hospital_management_system/Pages/settings_page.dart';
import 'package:hospital_management_system/chat_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HMS',
      theme: ThemeData(
        // Define your app's theme here
        primarySwatch: Colors.blue,
        // Other theme configurations
      ),
      home: HomePage(),
      routes: {
        '/registrationpage': (context) => RegistrationPage(),
        '/loginpage': (context) => LoginPage(),
        '/patientdashboard': (context) => PatientDashboard(),
        '/settingspage': (context) => SettingsPage(),
        '/profilepage': (context) => ProfilePage(),
        '/profiledoctor': (context) => ProfileDoctor(),
        '/finddoctorpage': (context) => FindDoctorPage(),
        '/submitquerypage': (context) => SubmitQueryPage(),
        '/viewresponsespage': (context) => ViewResponsesPage(),
        '/chatpage': (context) => ChatPage(),
        // Define other routes like '/patient_module', '/doctor_module', '/admin_module' here
        '/viewcomplain': (context) => ViewComplain(),
        '/manageUsers': (context) => ManageUsersPage(),
        '/admindashboard': (context) => AdminDashboard(),
        '/doctorsdashboard': (context) => DoctorsDashboard(),
      },
      // Other MaterialApp properties like initialRoute, navigatorKey, etc.
    );
  }
}
