import 'dart:io';
import 'package:desktop_webview_window/desktop_webview_window.dart';

class DesktopWebview {
  void create() async {
    final webview = await WebviewWindow.create(
      configuration: CreateConfiguration(
        windowHeight: 920,
        windowWidth: 1280,
        title: "web page title",
        titleBarTopPadding: Platform.isMacOS ? 20 : 0,
        titleBarHeight: 200,
        // userDataFolderWindows: await _getWebViewPath(),
      ),
    );
    webview.launch("https://xdf.cn");
  }
}
