import 'package:flutter/material.dart';
import 'package:pasada_admin_application/config/palette.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/appbar_search.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/drawer.dart';
import 'fleet_data.dart';

class Fleet extends StatefulWidget {
  @override
  _FleetState createState() => _FleetState();
}

class _FleetState extends State<Fleet> {
  int activeVehicles = 0;
  int idlingVehicles = 0;
  int offlineVehicles = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: AppBarSearch(),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Palette.whiteColor,
                  border: Border.all(color: Palette.blackColor, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    _buildVehicleStatus("Vehicle Active", activeVehicles),
                    _buildVerticalDivider(),
                    _buildVehicleStatus("Vehicle Idling", idlingVehicles),
                    _buildVerticalDivider(),
                    _buildVehicleStatus("Vehicle Offline", offlineVehicles),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount;
                  if (constraints.maxWidth >= 1200) {
                    crossAxisCount = 3;
                  } else if (constraints.maxWidth >= 800) {
                    crossAxisCount = 2;
                  } else {
                    crossAxisCount = 1;
                  }
                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 32.0,
                    mainAxisSpacing: 32.0,
                    childAspectRatio: 2,
                    children: List.generate(12, (index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                          context: context,
                            builder: (BuildContext context) {
                            return FleetData();
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Palette.whiteColor,
                            border: Border.all(color: Palette.blackColor, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Kotse $index", // Example: Label for each item
                              style: TextStyle(color: Palette.blackColor),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleStatus(String title, int count) {
    return Expanded(
      child: SizedBox(
        height: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 24.0,
                color: Palette.blackColor,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Palette.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 100.0,
      width: 1.0,
      color: Palette.blackColor,
    );
  }
}
