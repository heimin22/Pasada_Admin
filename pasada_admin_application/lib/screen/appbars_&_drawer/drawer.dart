import 'package:flutter/material.dart';
import 'package:pasada_admin_application/config/palette.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String currentRoute = ModalRoute.of(context)?.settings.name ?? '';

    return Drawer(
      child: Container(
        color: Palette.whiteColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Palette.whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pasada',
                    style: TextStyle(
                      color: Palette.blackColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            _createDrawerItem(
              context: context,
              icon: Icons.dashboard,
              text: 'Dashboard',
              routeName: '/dashboard',
              currentRoute: currentRoute,
            ),
            _createDrawerItem(
              context: context,
              icon: Icons.local_shipping,
              text: 'Fleet',
              routeName: '/fleet',
              currentRoute: currentRoute,
            ),
            _createDrawerItem(
              context: context,
              icon: Icons.bar_chart,
              text: 'Reports',
              routeName: '/reports',
              currentRoute: currentRoute,
            ),
            _createDrawerItem(
              context: context,
              icon: Icons.person,
              text: 'Drivers',
              routeName: '/drivers',
              currentRoute: currentRoute,
            ),
            _createDrawerItem(
              context: context,
              icon: Icons.assistant,
              text: 'AI Assistant',
              routeName: '/ai_chat',
              currentRoute: currentRoute,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Divider(
                color: Palette.blackColor,
                thickness: 1.0,
              ),
            ),
            _createDrawerItem(
              context: context,
              icon: Icons.settings,
              text: 'Settings',
              routeName: '/settings',
              currentRoute: currentRoute,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a drawer item.
  ///
  /// The item is highlighted based on whether the [routeName] matches the
  /// [currentRoute]. When tapped, it closes the drawer and, if not already
  /// selected, navigates to the designated page.
  Widget _createDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    required String routeName,
    required String currentRoute,
  }) {
    final bool selected = routeName == currentRoute;

    return InkWell(
      onTap: () {
        // If it's not the already selected route, navigate to the new route.
        Navigator.pop(context);
        if (!selected) {
          Navigator.pushReplacementNamed(context, routeName);
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: selected ? Palette.greyColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
          leading: Icon(
            icon,
            color: selected ? Palette.greenColor : Palette.blackColor,
          ),
          title: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Palette.blackColor,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
