import 'package:flutter/material.dart';
import 'package:pasada_admin_application/config/palette.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/appbar_search.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/drawer.dart';

class FleetData extends StatefulWidget {
  @override
  _FleetDataState createState() => _FleetDataState();
}

  class _FleetDataState extends State<FleetData> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: AppBarSearch(),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Fleet Data Page'),
      ),
    );
  }
}