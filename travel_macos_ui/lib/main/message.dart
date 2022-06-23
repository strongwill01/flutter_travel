import 'dart:io';

import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:travel_macos_ui/second.dart';

class Message extends StatefulWidget {
  Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  double _progressValue = 10;
  double _indicatorValue = 30;
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      toolBar: ToolBar(
        title: const Text('Dialogs and Sheets'),
        titleWidth: 150.0,
        actions: [
          ToolBarIconButton(
            label: 'Toggle Sidebar',
            icon: const MacosIcon(
              CupertinoIcons.sidebar_left,
            ),
            onPressed: () => MacosWindowScope.of(context).toggleSidebar(),
            showLabel: false,
          ),
        ],
      ),
      children: [
        ContentArea(builder: (context, scrollController) {
          return Center(
              child: Column(
            children: [
              Text(
                "Message",
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 5,
                    backgroundColor: Colors.blue[200]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProgressBar(
                  value: _progressValue,
                  trackColor: Colors.amber[600],
                  backgroundColor: Colors.amber[300],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CapacityIndicator(
                  value: _indicatorValue,
                  discrete: true,
                  onChanged: (v) {
                    setState(() {
                      _indicatorValue = v;
                      _progressValue = v;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: PushButton(
                  child: Text("push"),
                  buttonSize: ButtonSize.large,
                  onPressed: () {
                    print("button");
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SecondPage()));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: MacosSwitch(
                    value: _selected,
                    onChanged: (value) {
                      setState(() {
                        _selected = value;
                      });
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: PushButton(
                  child: Text("dialog"),
                  buttonSize: ButtonSize.small,
                  onPressed: () {
                    showMacDialog(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: MacosPulldownButton(
                  title: "Actions",
                  // Or provide an icon to use as title:
                  // icon: CupertinoIcons.ellipsis_circle,
                  items: [
                    MacosPulldownMenuItem(
                      title: const Text('Save'),
                      onTap: () async {
                        debugPrint("Saving...");

                        final webview = await WebviewWindow.create(
                          configuration: CreateConfiguration(
                            windowHeight: 1280,
                            windowWidth: 720,
                            title: "ExampleTestWindow",
                            titleBarTopPadding: Platform.isMacOS ? 20 : 0,
                            // userDataFolderWindows: await _getWebViewPath(),
                          ),
                        );
                        webview.launch("https://www.sina.com");
                      },
                    ),
                    MacosPulldownMenuItem(
                      title: const Text('Save as...'),
                      onTap: () => debugPrint("Opening Save As dialog..."),
                    ),
                    const MacosPulldownMenuDivider(),
                    MacosPulldownMenuItem(
                      enabled: false,
                      title: const Text('Export'),
                      onTap: () => debugPrint("Exporting"),
                    ),
                  ],
                ),
              )
            ],
          ));
        })
      ],
    );
  }

  void showMacDialog(BuildContext context) {
    BuildContext _dialogContext;
    showMacosAlertDialog(
        context: context,
        builder: (dialogContext) {
          _dialogContext = dialogContext;
          return MacosApp(
            home: MacosAlertDialog(
              appIcon: const FlutterLogo(size: 56),
              title: Text(
                "this is title",
                style: MacosTheme.of(context).typography.headline,
              ),
              message: Text(
                "this is message.You might need some content. ",
                style: MacosTheme.of(context).typography.headline,
                textAlign: TextAlign.center,
              ),
              primaryButton: PushButton(
                buttonSize: ButtonSize.large,
                onPressed: () {
                  Navigator.pop(_dialogContext);
                },
                child: const Text("Confirm"),
              ),
            ),
          );
        });
  }
}
