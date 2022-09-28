import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_travel/websocket/socket_io_client.dart';

void main(List<String> args) {
  runApp(SocketDemo());
}

class SocketDemo extends StatefulWidget {
  SocketDemo({Key? key}) : super(key: key);

  @override
  State<SocketDemo> createState() => _SocketDemoState();
}

class _SocketDemoState extends State<SocketDemo> {
  String changeActivityData =
      """{"cmd":"changeActivity","activityId":749752,"minicourseId":49425}""";
  String uri =
      "https://ailearn-instruction-svr.ailearn.ink?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHBpcmVzSW4iOiI2MDQ4MDAiLCJzeXN0ZW1JZCI6IjYyOTUxNTc5NDQ0IiwibG9naW5UeXBlIjoiMyIsInNoYXJlVG9rZW4iOiJmYWxzZSIsInVzZXJUeXBlIjoiMSIsIm9yZ0lkIjoiNTQiLCJ0aW1lc3RhbXAiOiIxNjYyNDQ3NzU0ODg2In0.Hh6YtzCP69nwQIhjMu-jTf4xnSwL2bnWcI5F-IPEuIY&loginType=0&systemId=62951579444&userType=2&tty=1";

  SocketIOClient? socketIOClient;
  @override
  void initState() {
    super.initState();
    socketIOClient = SocketIOClient();
  }

  _connect() {
    socketIOClient?.connect(uri);
  }

  _sendMsg() {
    List args = [
      {'cmd': 'changeActivity', 'activityId': 749752, 'minicourseId': 49425}
    ];
    socketIOClient?.sendMsg(args);
  }

  _emit() {
    // Map map = {
    //   'cmd': 'changeActivity',
    //   'activityId': 749752,
    //   'minicourseId': 49425
    // };

    Map<String, dynamic> map = {};
    map['cmd'] = "ccc";
    map['activityId'] = "123456";
    map['minicourseId'] = "123";

    // socketIOClient?.emit('my_event', jsonEncode(map));
    socketIOClient?.emit('my_event', JsonEncoder().convert(map).characters);
  }

  _emitWithAck() {
    Map map = {
      'cmd': 'changeActivity',
      'activityId': 749752,
      'minicourseId': 49425
    };
    socketIOClient?.emitWithAck('my_event', {'cmd': 'change'});
  }

  _packet() {
    Map map = {
      'type': 2,
      'data':
          "{\"cmd\":\"ccc\",\"activityId\":\"123456\",\"minicourseId\":\"123\"}"
    };
    socketIOClient?.packet('my_event', map);
  }

  _disconnect() {
    socketIOClient?.disConnect();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "socket demo",
      color: Colors.red,
      themeMode: ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: Text("socket demo"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _connect();
                },
                child: const Text("connect"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _sendMsg();
                },
                child: const Text("send event"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _emit();
                },
                child: const Text("emit"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _emitWithAck();
                },
                child: const Text("emitWithAck"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _packet();
                },
                child: const Text("packet"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _disconnect();
                },
                child: const Text("dis connect"),
              ),
            ),
            GestureDetector(
              child: const Text("result:"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
