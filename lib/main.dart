import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel/travel_list/login.dart';
import 'package:window_manager/window_manager.dart';
import 'travel_list/pkg_info.dart';

void main() {
  changeScreenSize(800, 600);
// getApplicationDocumentsDirectory

  runApp(MaterialApp(
    title: 'main',
    home: const MyApp(),
  ));
  // runApp(LoginPage());
  // runApp(PkgInfos(
  //   title: 'package info',
  // ));
}

Future changeScreenSize(double width, double height) async {
  if (kIsWeb || Platform.isIOS || Platform.isAndroid) {
    return;
  }

  if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    WidgetsFlutterBinding.ensureInitialized();

    // 1、desktop_window
    // await DesktopWindow.setFullScreen(true);
    // if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    //   await DesktopWindow.setWindowSize(const Size(700, 500));
    //   // await DesktopWindow.setMinWindowSize(const Size(300, 200));
    //   // await DesktopWindow.setMaxWindowSize(const Size(1200, 800));
    // }

// 2、window_manager
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = WindowOptions(
        size: Size(width, height),
        center: true,
        skipTaskbar: true,
        fullScreen: false,
        maximumSize: const Size(1000, 800),
        minimumSize: const Size(300, 400));
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Travel'),
          actions: [
            PopupMenuButton(
              position: PopupMenuPosition.under,
              itemBuilder: (context) => [
                PopupMenuItem(
                    enabled: Platform.isMacOS || Platform.isWindows,
                    value: 'zoom_window',
                    child: Row(
                      children: [Icon(Icons.message), Text("窗口")],
                    )),
                PopupMenuItem(
                  value: 'pkginfo',
                  child: Row(
                    children: const [
                      Icon(Icons.info),
                      Text("应用信息"),
                    ],
                  ),
                ),
              ],
              onSelected: (String id) {
                print("id=${id}");
                switch (id) {
                  case 'pkginfo':
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return PkgInfos(title: 'package info');
                      },
                    ));
                    break;
                  case 'zoom_window':
                    print('zoom_window...');
                    changeScreenSize(300, 450);
                    // () async {
                    //   WidgetsFlutterBinding.ensureInitialized();
                    //   await DesktopWindow.setWindowSize(Size(100, 300));
                    // };
                    break;
                  default:
                  // do nothing
                }
              },
            ),
          ],
        ),
        // body: IconButton(
        //   icon: const Icon(Icons.favorite),
        //   onPressed: () async {
        //     Webview webview = await WebviewWindow.create(
        //         configuration: CreateConfiguration(title: "webview page"));

        //     webview.launch("https://www.baidu.com");
        //   },
        // ),
        body: Container(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void dispose() {
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'desktop',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
