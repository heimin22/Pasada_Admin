import 'package:flutter/material.dart';
import 'package:pasada_admin_application/config/palette.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/appbar_search.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/drawer.dart';

class ReportsChat extends StatefulWidget {
  @override
  _ReportsChatState createState() => _ReportsChatState();
}

  class _ReportsChatState extends State<ReportsChat> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: AppBarSearch(),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Reports Chat Page'),
      ),
    );
  }
}