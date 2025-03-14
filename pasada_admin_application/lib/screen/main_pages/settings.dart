import 'package:flutter/material.dart';
import 'package:pasada_admin_application/config/palette.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/appbar_search.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/drawer.dart';

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
        // This outer Container fills the entire screen.
        child: Center(
          // Centers the inner container
          child: Container(
            // Constrain its width to 80% of the screen width for responsiveness.
            width: MediaQuery.of(context).size.width * 0.47,
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Disables scrolling.
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
        print("$title container clicked");
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Palette.whiteColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Palette.blackColor.withOpacity(0.5),
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
                color: Palette.blackColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
