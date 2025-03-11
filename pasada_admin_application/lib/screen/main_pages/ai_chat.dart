import 'package:flutter/material.dart';
import 'package:pasada_admin_application/config/palette.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/appbar_search.dart';
import 'package:pasada_admin_application/screen/appbars_&_drawer/drawer.dart';

class AiChat extends StatefulWidget {
  @override
  _AiChatState createState() => _AiChatState();
}

  class _AiChatState extends State<AiChat> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: AppBarSearch(),
      drawer: MyDrawer(),
      body: Center(
        child: Text('AI Assistant Page'),
      ),
    );
  }
}