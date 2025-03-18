import 'package:flutter/material.dart';
import 'package:pasada_admin_application/screen/main_pages/dashboard_pages/dashboard.dart';
import 'package:pasada_admin_application/screen/login_signup.dart';
import 'package:pasada_admin_application/screen/main_pages/fleet_pages/fleet.dart';
import 'package:pasada_admin_application/screen/main_pages/drivers_pages/drivers.dart';
import 'package:pasada_admin_application/screen/main_pages/reports_pages/reports.dart';
import 'package:pasada_admin_application/screen/main_pages/ai_chat.dart';
import 'package:pasada_admin_application/screen/settings_pages/settings.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Pasada Admin',
      home: LoginSignup(),
      routes: {
        '/dashboard': (context) => Dashboard(),
        '/login': (context) => LoginSignup(),
        '/fleet': (context) => Fleet(),
        '/drivers': (context) => Drivers(),
        '/reports': (context) => Reports(),
        '/ai_chat': (context) => AiChat(),
        '/settings': (context) => Settings(),
      }
    );
  }
}
