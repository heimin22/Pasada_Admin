import 'package:flutter/material.dart';
import 'package:pasada_admin_application/config/palette.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/appbar_search.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/drawer.dart';

class DataTables extends StatefulWidget {
  @override
  _DataTablesState createState() => _DataTablesState();
}

class _DataTablesState extends State<DataTables> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: AppBarSearch(),
      drawer: MyDrawer(),
      body: Center(
        // Center the table in the available space.
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            // Define the table headers.
            columns: const [
              DataColumn(
                label: Text(
                  'ID',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Palette.blackColor,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Palette.blackColor,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Palette.blackColor,
                  ),
                ),
              ),
            ],
            // No rows defined, hence the table appears blank.
            rows: const [],
          ),
        ),
      ),
    );
  }
}
