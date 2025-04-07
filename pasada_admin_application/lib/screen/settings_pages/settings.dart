import 'package:flutter/material.dart';
import 'package:pasada_admin_application/config/palette.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/appbar_search.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/drawer.dart';
import 'profilepopup.dart';
import 'updatespopup.dart';
import 'securitypopup.dart';
import 'notifpopup.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: AppBarSearch(),
      drawer: MyDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.47,
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: [
                _buildContainer("Profile"),
                _buildContainer("Notifications"),
                _buildContainer("Real-Time Updates"),
                _buildContainer("Security"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(String title) {
    return GestureDetector(
      onTap: () {
        if (title == "Profile") {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ProfilePopup();
            },
          );
        }
        if (title == "Real-Time Updates") {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return UpdatesPopup();
            },
          );
        }
        if (title == "Security") {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SecurityPopUp();
            },
          );
        }
        if (title == "Notifications") {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return NotifPopUp();
            },
          );
        } else {
          print("$title container clicked");
        }
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Palette.whiteColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Palette.blackColor.withValues(alpha: 128),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              "Placeholder text for $title",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: Palette.blackColor.withValues(alpha: 128),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
