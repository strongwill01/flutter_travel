// import 'package:flutter/material.dart';
import 'dart:io';

import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:travel_macos_ui/second.dart';

import 'main/home.dart';
import 'main/message.dart';
import 'util/platform.dart' as platform_env;

class MacOSUIHomeApp extends StatelessWidget {
  const MacOSUIHomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    //   if (runWebViewTitleBarWidget(args)) {
    //   return;
    // }

    return MacosApp(
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark(),
      // themeMode: ThemeMode.system,
      home: MacOSUIHome(),
    );
  }
}

class MacOSUIHome extends MacosWindow {
  MacOSUIHome({Key? key}) : super(key: key);

  @override
  State<MacOSUIHome> createState() => _MacOSUIHomeState();
}

class _MacOSUIHomeState extends State<MacOSUIHome> {
  int _pageIndex = 0;
  double _indicatorValue = 30;
  double _progressValue = 10;

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      titleBar: TitleBar(
        padding: EdgeInsets.zero,
        title: Container(
          padding: EdgeInsets.zero,
          color: Colors.blue,
          width: double.infinity, // MediaQuery.of(context).size.width,
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "macOS UI",
                style: TextStyle(fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
        height: 40.0,
        dividerColor: Colors.blue,
      ),
      sidebar: Sidebar(
          topOffset: 16.0,
          top: Column(
            children: const [
              FlutterLogo(size: 40.0),
              SizedBox(height: 8.0),
              Text("MAC UI", style: TextStyle(color: Colors.black87)),
              SizedBox(height: 16.0)
            ],
          ),
          bottom: Column(
            children: [
              HelpButton(
                onPressed: () {
                  debugPrint('pressed help button ${platform_env.isMobile()}');
                },
              ),
              const Text("first line"),
              const Text("second line"),
            ],
          ),
          builder: (context, scrollController) {
            return SidebarItems(
              currentIndex: _pageIndex,
              onChanged: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              items: const [
                SidebarItem(
                    label: Text("Home"),
                    leading: MacosIcon(CupertinoIcons.home)),
                SidebarItem(
                    label: Text("Search"),
                    leading: MacosIcon(CupertinoIcons.search)),
                SidebarItem(
                    label: Text("Message"),
                    leading: MacosIcon(CupertinoIcons.bell)),
              ],
            );
          },
          minWidth: 200),
      child: IndexedStack(
        index: _pageIndex,
        children: [
          MacosScaffold(
            children: [
              ContentArea(builder: (context, scrollController) {
                return Home(title: "Home2");
              })
            ],
          ),
          MacosScaffold(
            children: [
              ContentArea(builder: (context, scrollController) {
                return const Center(
                  child: Text("Search"),
                );
              })
            ],
          ),
          Message(),
        ],
      ),
    );
  }
}
