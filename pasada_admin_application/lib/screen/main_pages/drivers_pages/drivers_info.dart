import 'package:flutter/material.dart';
import 'package:pasada_admin_application/config/palette.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/appbar_search.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/drawer.dart';

class DriversInfo extends StatefulWidget {
  @override
  _DriversInfoState createState() => _DriversInfoState();
}

  class _DriversInfoState extends State<DriversInfo> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: AppBarSearch(),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Drivers Info Page'),
      ),
    );
  }
}