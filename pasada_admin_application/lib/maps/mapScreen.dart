// import 'dart:io';
// import 'package:desktop_webview_window/desktop_webview_window.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// class Mapscreen extends StatefulWidget {
//   const Mapscreen({super.key});

//   @override
//   State<Mapscreen> createState() => MapsScreenState();
// }

// class MapsScreenState extends State<Mapscreen> {
//   // late final WebViewController _controller;
//   WebviewWindow? webview;
//   final String apiKey = dotenv.env['WEB_MAPS_API_KEY']!;

//   @override
//   void initState() {
//     super.initState();
//     _initializeWebviewWindow();
//   }

//   Future<void> _initializeWebviewWindow() async {
//     webview = await WebviewWindow.create(
//       configuration: CreateConfiguration(
//         windowWidth: 1024,
//         windowHeight: 768,
//       ),
//     );

//     final localFile = Uri.file('${Directory.current.path}/assets/web/map.html').toString();

//     webview?.loadUrl(localFile);

//     webview!.addScriptToExecuteOnDocumentCreated(
//       "window.initializeMap('$apiKey');",
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'The map is launched in a separate window.',
//           style: TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
// }
