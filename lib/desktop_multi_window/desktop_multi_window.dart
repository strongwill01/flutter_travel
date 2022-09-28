import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(DMultiWindowExample());
}

class DMultiWindowExample extends StatefulWidget {
  DMultiWindowExample({Key? key}) : super(key: key);

  @override
  State<DMultiWindowExample> createState() => _DMultiWindowExampleState();
}

class _DMultiWindowExampleState extends State<DMultiWindowExample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: ElevatedButton(
            onPressed: () {
              openNewWindow();
            },
            child: Text("open new windown.")),
      ),
    );
  }

  void openNewWindow() async {
    final window = await DesktopMultiWindow.createWindow(jsonEncode({
      'args1': 'Sub Window',
      'args2': 100,
      'args3': true,
      'bussiness': 'bussiness_test',
    }));
    window
      ..setFrame(const Offset(0, 0) & const Size(1280, 720))
      ..center()
      ..setTitle('New Window')
      ..show();
  }
}
