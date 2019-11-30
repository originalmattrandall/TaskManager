import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/shared_preferences.dart';

class UserSettings extends StatefulWidget {
  UserSettings({Key key}) : super(key: key);

  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {

  UserSettingsPreferences _userPreferences = new UserSettingsPreferences();

  @override
  Widget build(BuildContext context) {

    final double leftAndRightPadding = MediaQuery.of(context).size.width*0.086;

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
        body: Column(
            children: [ 
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.fromLTRB(leftAndRightPadding, 10, leftAndRightPadding, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Archive Tasks Before Deleting?",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: FutureBuilder(
                        future: _userPreferences.getArchiveBeforeDelete(),
                        initialData: false,
                        builder: (context, snapshot){
                          return Switch(
                            activeColor: Theme.of(context).primaryColor,
                            value: snapshot.data,
                            onChanged: (value) {
                              setState(() {
                                _userPreferences.setArchiveBeforeDelete(value);
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Text("hello2")
            ],
          ),
        ),
    );
  }
}