import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:pasada_admin_application/config/palette.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/appbar_search.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/drawer.dart';

class AdminTableScreen extends StatefulWidget {
  const AdminTableScreen({Key? key}) : super(key: key);

  @override
  _AdminTableScreenState createState() => _AdminTableScreenState();
}

class _AdminTableScreenState extends State<AdminTableScreen> {
  final SupabaseClient supabase = Supabase.instance.client;
  List<Map<String, dynamic>> adminData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAdminData();
  }

  Future<void> fetchAdminData() async {
    try {
      // Use .select('*') to explicitly select all columns
      final data = await supabase.from('adminTable').select('*');
      print("Fetched data: $data"); // Debug print to verify data retrieval
      final List listData = data as List;
      setState(() {
        adminData = listData.cast<Map<String, dynamic>>();
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching admin data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: AppBarSearch(),
      drawer: MyDrawer(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : adminData.isEmpty
              ? const Center(child: Text("No data found."))
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Admin ID')),
                      DataColumn(label: Text('First Name')),
                      DataColumn(label: Text('Last Name')),
                      DataColumn(label: Text('Mobile Number')),
                      DataColumn(label: Text('Password')),
                      DataColumn(label: Text('Created At')),
                    ],
                    rows: adminData.map((admin) {
                      return DataRow(cells: [
                        DataCell(Text(admin['admin_id'].toString())),
                        DataCell(Text(admin['first_name'].toString())),
                        DataCell(Text(admin['last_name'].toString())),
                        DataCell(Text(admin['admin_mobile_number'].toString())),
                        DataCell(Text(admin['admin_password'].toString())),
                        DataCell(Text(admin['created_at'].toString())),
                      ]);
                    }).toList(),
                  ),
                ),
    );
  }
}
