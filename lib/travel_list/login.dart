import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: Container(
        child: Scaffold(
          body: Column(
            children: [
              UserNameWidget(error: "init"),
              TextButton(
                onPressed: () {
                  // _userNameWidget.error = "error...${DateTime.now().second}";
                  UserNameWidget(error: "error...${DateTime.now().second}");
                },
                child: Text(
                  "Login",
                  overflow: TextOverflow.visible,
                ),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(8.0),
                  primary: Colors.lightBlue,
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

@immutable
class UserNameWidget extends StatefulWidget {
  UserNameWidget({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  State<UserNameWidget> createState() => _UserNameWidgetState();
}

class _UserNameWidgetState extends State<UserNameWidget> {
  String ee = "";
  String setError(String e) {
    ee = e;
    setState(() {});
    return ee; //
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      maxLength: 60,
      decoration: InputDecoration(
        icon: const Icon(Icons.person),
        labelText: 'userName:',
        labelStyle: const TextStyle(
          color: Colors.lightBlue,
          fontSize: 22,
        ),
        hintText: "please enter your username.",
        helperText: "username or mobile or email.",
        errorText: setError(widget.error),
      ),
    );
  }
}
