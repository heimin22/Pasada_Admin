import 'package:flutter/material.dart';
import 'package:pasada_admin_application/config/palette.dart';

class SecurityPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width * 0.7;
    final double sideLength = screenWidth * 0.6;
    
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      backgroundColor: Palette.whiteColor,
      child: Container(
        width: sideLength,
        height: sideLength,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Security",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Palette.blackColor,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close,
                    size: 24,
                    color: Palette.blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Divider(color: Palette.blackColor.withValues(alpha: 128)),
            const SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  "This is the Security popup. Add Security settings and additional information here as needed.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Palette.blackColor,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Palette.whiteColor,
                  foregroundColor: Palette.blackColor,
                  elevation: 6.0,
                  shadowColor: Colors.grey,
                  side: BorderSide(color: Colors.grey, width: 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
                onPressed: () {
                },
                child: Text(
                  "Edit Security",
                  style: TextStyle(
                    fontSize: 16,
                    color: Palette.blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
