// import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

void main(List<String> args) {
  runApp(WebviewFlutterMain());
}

class WebviewFlutterMain extends StatefulWidget {
  WebviewFlutterMain({Key? key}) : super(key: key);

  @override
  State<WebviewFlutterMain> createState() => _WebviewFlutterMainState();
}

class _WebviewFlutterMainState extends State<WebviewFlutterMain> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Container(
        color: const Color.fromARGB(255, 121, 199, 235),
        child: Center(
            child: WebView(
          // initialUrl: "https://flutter.dev",
          initialUrl: "http://10.60.110.129:8080/web_page/test.html",
          onWebViewCreated: (_) {
            debugPrint("onWebViewCreated......");
            _controller.complete(_);
          },
          onPageStarted: (url) {
            debugPrint("onPageStarted, url=$url");
          },
          javascriptChannels: <JavascriptChannel>{
            JavascriptChannel(
                name: "Toaster",
                onMessageReceived: (msg) {
                  debugPrint("javascriptChannels,onMessageReceived, msg=$msg");
                }),
          },
        )),
      ),
    );
  }
}
