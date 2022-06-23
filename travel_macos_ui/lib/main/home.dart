import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  String? title;

  Home({Key? key, this.title}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // String title = "Home";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("home~~"),
    );
  }
}
