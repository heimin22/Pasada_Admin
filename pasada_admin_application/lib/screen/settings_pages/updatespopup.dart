import 'package:flutter/material.dart';
import 'package:pasada_admin_application/config/palette.dart';

class UpdatesPopup extends StatelessWidget {
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
                  "Real-Time Updates",
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
            // Main popup content.
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  "This is the Update popup. Add Real-Time Updates settings and additional information here as needed.",
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
