import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'travel_list/pkg_info.dart';
import 'package:flutter/foundation.dart';

class HomeDemo extends StatelessWidget {
  const HomeDemo({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
            text: TextSpan(
                text: "DEMO", style: TextStyle(color: Colors.amber[700]))),
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
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("Content"),
            )
          ],
        ),
      ),
    );
  }
}
