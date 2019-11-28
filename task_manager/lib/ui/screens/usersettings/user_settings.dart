import 'package:flutter/material.dart';

class UserSettings extends StatefulWidget {
  UserSettings({Key key}) : super(key: key);

  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey,
          ),
          title: Text(
              "User Settings",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              )
            ),
          elevation: 0.0,    
          backgroundColor: Colors.white,
        ),
        body: Text("body"),
        ),
    );
  }
}