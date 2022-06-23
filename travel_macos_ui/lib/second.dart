import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      toolBar: ToolBar(
        title: Text("second page"),
        leading: MacosBackButton(onPressed: () {
          print("back");
          Navigator.of(context).pop;
        }),
      ),
    );
  }
}
