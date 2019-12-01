import 'package:flutter/material.dart';
import 'package:task_manager/data/shared_preferences.dart';
import 'package:task_manager/ui/widgets/usersettings/settings_switch.dart';

class UserSettings extends StatefulWidget {
  UserSettings({Key key}) : super(key: key);

  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {

  UserSettingsPreferences _userPreferences = new UserSettingsPreferences();

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
        body: Column(
            children: [ 
              SettingsSwitch(
                title: "Archive Tasks Before Deleting",
                future: _userPreferences.getArchiveBeforeDelete(),
                function: (value) async {
                  setState(() {
                    _userPreferences.setArchiveBeforeDelete(value);
                  });
                },
              ),
              SettingsSwitch(
                title: "Turn Off Notifications",
                future: _userPreferences.getTurnOffNotifications(),
                function: (value) async {
                  setState(() {
                    _userPreferences.setTurnOffNotifications(value);
                  });
                },
              ),
            ],
          ),
        ),
    );
  }
}