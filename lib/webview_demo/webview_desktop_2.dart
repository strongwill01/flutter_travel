import 'package:flutter/material.dart';
import 'package:flutter_travel/webview_demo/home_demo.dart';
import 'package:flutter_travel/webview_demo/second_page.dart';
import 'package:flutter_travel/webview_demo/smart_login.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';

void main(List<String> args) {
  if (runWebViewTitleBarWidget(args)) {
    return;
  }

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp2());
}

class MyApp2 extends StatefulWidget {
  MyApp2({Key? key}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => SmartLogin(),
        '/home': (context) => Home(),
        '/second_page': (context) => SecondPage(),
      },
      initialRoute: '/home',
      home: Container(
        // color: Colors.blueAccent,
        child: Text("who ?"),
      ),
    );
  }
}
