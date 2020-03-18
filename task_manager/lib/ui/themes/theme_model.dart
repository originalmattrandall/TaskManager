import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/shared_preferences.dart';
import 'package:task_manager/ui/themes/light_blue_theme.dart';

enum ThemeType { Light, Dark }

class ThemeModel extends ChangeNotifier {
  final SharedPreferences _preferences;
  final UserSettingsPreferences _userSettings = new UserSettingsPreferences();

  ThemeData currentTheme;
  ThemeType _themeType;

  ThemeModel(this._preferences) {
    var darkModeOn = _preferences.getBool(_userSettings.darkMode) ?? false;
    
    if(darkModeOn){
      currentTheme = initializeDarkMode();
    } else{
      currentTheme = initializeLightMode();
    }
    // currentTheme =
    //     _preferences.getBool(_userSettings.darkMode) ? initializeDarkMode() : initializeLightMode();
  }

  toggleTheme() {
    if (_themeType == ThemeType.Dark) {
      currentTheme = lightTheme;
      _themeType = ThemeType.Light;
      return notifyListeners();
    }

    if (_themeType == ThemeType.Light) {
      currentTheme = darkTheme;
      _themeType = ThemeType.Dark;
      return notifyListeners();
    }
  }

  initializeDarkMode() {
    currentTheme = darkTheme;
    _themeType = ThemeType.Dark;
    return darkTheme;
  }

  initializeLightMode() {
    currentTheme = lightTheme;
    _themeType = ThemeType.Light;
    return lightTheme;
  }
}
