import 'package:flutter/material.dart';
import 'package:pasada_admin_application/screen/main_pages/dashboard_pages/dashboard.dart';
import 'package:pasada_admin_application/screen/login_signup.dart';
import 'package:pasada_admin_application/screen/main_pages/fleet_pages/fleet.dart';
import 'package:pasada_admin_application/screen/main_pages/drivers_pages/drivers.dart';
import 'package:pasada_admin_application/screen/main_pages/reports_pages/reports.dart';
import 'package:pasada_admin_application/screen/main_pages/ai_chat.dart';
import 'package:pasada_admin_application/screen/settings_pages/settings.dart';
import 'package:pasada_admin_application/screen/main_pages/reports_pages/data_tables.dart';
import 'package:pasada_admin_application/screen/main_pages/reports_pages/select_table.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im90YndoaXR3cm1uZnFncG1uanZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMzOTk5MzQsImV4cCI6MjA0ODk3NTkzNH0.f8JOv0YvKPQy8GWYGIdXfkIrKcqw0733QY36wJjG1Fw',
      url: 'https://otbwhitwrmnfqgpmnjvf.supabase.co'
  );
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
        '/data_tables': (context) => DataTables(),
        '/select_table': (context) => SelectTable(),
      }
    );
  }
}
