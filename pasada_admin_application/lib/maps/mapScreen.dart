import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Mapscreen extends StatefulWidget {
  const Mapscreen({super.key});

  @override
  State<Mapscreen> createState() => MapsScreenState();
}

class MapsScreenState extends State<Mapscreen> {
  late final WebViewController webViewController;
  final String apiKey = dotenv.env['WEB_MAPS_API_KEY']!;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('ApiKeyChannel', onMessageReceived: (message) {
        webViewController.runJavaScript('''
      initializeMap("${apiKey}");
    ''');
      })
      ..loadHtmlString('''
    <!DOCTYPE html>
    <html>
    <head>
      <script src="map.js"></script>
    </head>
    <body>
      <div id="map" style="height:100vh"></div>
      <script>
        // Initialize map after API key is received
        window.ApiKeyChannel.postMessage("ready");
      </script>
    </body>
    </html>
  ''');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
