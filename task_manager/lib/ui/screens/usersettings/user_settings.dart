import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/data/shared_preferences.dart';
import 'package:task_manager/ui/themes/theme_model.dart';
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
          elevation: 0.0,
          title: Text(
            "User Settings",
          ),
        ),
        body: Column(
          children: [
            SettingsSwitch(
              title: "Dark Mode",
              future: _userPreferences.getDarkMode(),
              function: (value) {
                _userPreferences.setDarkMode(value);
                Provider.of<ThemeModel>(context, listen: false).toggleTheme();
              },
            ),
            // SettingsSwitch(
            //   title: "Archive Tasks Before Deleting",
            //   future: _userPreferences.getArchiveBeforeDelete(),
            //   function: (value) async {
            //       _userPreferences.setArchiveBeforeDelete(value);
            //   },
            // ),
            // SettingsSwitch(
            //   title: "Turn Off Notifications",
            //   future: _userPreferences.getTurnOffNotifications(),
            //   function: (value) async {
            //       _userPreferences.setTurnOffNotifications(value);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
