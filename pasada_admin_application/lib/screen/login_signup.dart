import 'package:flutter/material.dart';
import 'package:pasada_admin_application/config/palette.dart';

class LoginSignup extends StatefulWidget {
  @override
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  bool isRememberMe = false;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = (screenWidth * 0.5).clamp(400, 800);
    final horizontalPadding = (screenWidth - containerWidth) / 2;

    return Scaffold(
      backgroundColor: Palette.whiteColor,
      body: Stack(
        children: [
          Positioned(
            top: 250,
            left: horizontalPadding,
            right: horizontalPadding,
            child: Container(
              height: 500,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Palette.whiteColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Palette.blackColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 51),
                    spreadRadius: 5,
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle, size: 58, color: Palette.blackColor),
                        SizedBox(width: 8),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text(
                              "Novadeci Transport Cooperative",
                              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 56),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Log-in to your account",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildRichText('Enter your ', 'Admin ID'),
                                SizedBox(height: 8),
                                _buildTextField("Enter your Admin ID"),
                                SizedBox(height: 24),
                                _buildRichText('Enter your ', 'password.'),
                                SizedBox(height: 8),
                                _buildPasswordField(),
                                SizedBox(height: 28),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/dashboard');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      minimumSize: Size(170, 50),
                                    ),
                                    child: Text("Log-in"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  RichText _buildRichText(String text, String boldText) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 16,
          letterSpacing: 1,
          color: Palette.blackColor,
        ),
        children: [
          TextSpan(
            text: boldText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  TextField _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }

  TextField _buildPasswordField() {
    return TextField(
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: "Enter your password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 12),
          child: IconButton(
            icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
          ),
        ),
      ),
    );
  }
}
