import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(ListDemo());
}

class ListDemo extends StatelessWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListView(
        children: [
          Column(
            children: const [
              Text("Title"),
              Text("sub Title"),
              Text("Description"),
            ],
          ),
          Column(
            children: [
              Text("Title2"),
              Text("sub Title3"),
              Text("Description3"),
            ],
          ),
          Column(
            children: [
              Text("Title"),
              Text("sub Title"),
              Text("Description"),
            ],
          ),
          Column(
            children: [
              Text("Title"),
              Text("sub Title"),
              Text("Description"),
            ],
          ),
          Column(
            children: [
              Text("Title"),
              Text("sub Title"),
              Text("Description"),
            ],
          ),
        ],
      ),
    );
  }
}
