// import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_jsbridge/webview_jsbridge.dart';
// import 'package:webview_javascript_bridge/webview_javascript_bridge.dart'
//     as jsBridge;
// import 'package:webview_javascript_bridge/webview_javascript_bridge.dart';
// import 'package:flutter_jsbridge_plugin/flutterjsbridgeplugin.dart';
// import 'package:flutter_jsbridge_plugin/js_bridge.dart';

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

    // JsBridge _jsBridge = JsBridge();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Container(
        color: const Color.fromARGB(255, 121, 199, 235),
        child: Center(
          child: Visibility(
            visible: Platform.isAndroid || Platform.isIOS,
            replacement: const Text("current webview only support android&ios"),
            child: WebView(
              // javascriptChannels: {
              //   channelForBridge,
              // },
              javascriptChannels: <JavascriptChannel>{
                JavascriptChannel(
                    name: "webLogin",
                    onMessageReceived: (msg) {
                      debugPrint(
                          "openw [webLogin] javascriptChannels,onMessageReceived, msg=${msg.message}");
                    }),
                // JavascriptChannel(
                //     name: "WebViewJavascriptBridgcallHandler",
                //     onMessageReceived: (msg) {
                //       debugPrint(
                //           "openw [WebViewJavascriptBridgcallHandler] javascriptChannels,onMessageReceived, msg=$msg");
                //     }),
                JavascriptChannel(
                    name: "MoonBridge",
                    onMessageReceived: (msg) {
                      debugPrint(
                          "openw [MoonBridge] javascriptChannels,onMessageReceived, msg=${msg.message}");
                    }),
              },
              // initialUrl: "https://daoxue.okay.cn/checkLogin.html?loginType=xdf",
              initialUrl: "http://10.60.110.129:8080/web_page/test.html",
              // initialUrl:
              //     "https://daoxue.okay.cn/teaching.html#/room?cid=545373&uid=62952576952&role=1&pure=true&tab=false&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHBpcmVzSW4iOiI2MDQ4MDAiLCJzeXN0ZW1JZCI6IjYyOTUyNTc2OTUyIiwibG9naW5UeXBlIjoiMyIsInNoYXJlVG9rZW4iOiJmYWxzZSIsInVzZXJUeXBlIjoiMSIsIm9yZ0lkIjoiNTQiLCJ0aW1lc3RhbXAiOiIxNjU5MzIxNzkxOTY4In0.0MxVuSsLxSBNSj1u2QxDCZabplWr_GC1lrKIB61lLuY&start=none&version=1.6.3.199",
              // initialUrl:
              //     "http://10.60.110.167:7777/#/room?cid=545373&uid=62952576952&role=1&pure=true&tab=false&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHBpcmVzSW4iOiI2MDQ4MDAiLCJzeXN0ZW1JZCI6IjYyOTUyNTc2OTUyIiwibG9naW5UeXBlIjoiMyIsInNoYXJlVG9rZW4iOiJmYWxzZSIsInVzZXJUeXBlIjoiMSIsIm9yZ0lkIjoiNTQiLCJ0aW1lc3RhbXAiOiIxNjU5MzIxNzkxOTY4In0.0MxVuSsLxSBNSj1u2QxDCZabplWr_GC1lrKIB61lLuY&start=none&version=1.6.3.199",
              // initialUrl: "http://10.60.110.167:7777/#/",
              // initialUrl: "https://www.126.com",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (_) {
                print("openw onWebViewCreated......");
                _controller.complete(_);
              },
              onPageStarted: (url) {
                print("openw onPageStarted, url=$url");
              },
              onPageFinished: (url) {
                print("openw onPageFinished, url=$url");
              },
              navigationDelegate: (NavigationRequest navigationRequest) {
                if (navigationRequest.url
                    .startsWith("WebViewJavascriptBridg.callHandler")) {
                  print('openw blocking navigation to $navigationRequest}');
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          ),
        ),
      ),
    );
  }
}
