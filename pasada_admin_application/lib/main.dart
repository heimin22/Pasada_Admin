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
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // initializing supabase using the .env file
  await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
      realtimeClientOptions: const RealtimeClientOptions(
        logLevel: RealtimeLogLevel.info,
      ),
      storageOptions: const StorageClientOptions(
        retryAttempts: 10,
      ));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        });
  }
}
