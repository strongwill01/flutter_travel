import 'package:flutter/material.dart';
import 'package:webview_cef/webview_cef.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = WebviewController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("webview cef"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(
                child: Text("data"),
                onTap: () {
                  _controller.loadUrl("https://xdf.cn");
                },
              ),
              _controller.value
                  ? Expanded(child: Webview(_controller))
                  : const Text("not init"),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> initPlatformState() async {
    String url = "https://xdf.cn";
    await _controller.initialize();
    // await _controller.loadUrl(url);

    if (!mounted) return;

    setState(() {});
  }
}
