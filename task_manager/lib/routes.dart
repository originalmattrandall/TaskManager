import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/createfilter/create_filter.dart';
import 'package:task_manager/ui/screens/createtask/edit_task.dart';
import 'package:task_manager/ui/screens/usersettings/user_settings.dart';
import 'package:task_manager/ui/screens/createtask/create_task.dart';
import 'package:task_manager/ui/screens/home/main_page.dart';

class Routes {
  static String homeList = "/";
  static String createTask = "CreateTask";
  static String createFilter = "CreateFilter";
  static String userSettings = "UserSettings";
  static String editTask = "EditTask";

  static var routes = <String, WidgetBuilder>{
    homeList: (BuildContext context) => MainPage(),
    createTask: (BuildContext context) => CreateTask(),
    editTask: (BuildContext context) => EditTask(),
    createFilter: (BuildContext context) => CreateFilter(),
    userSettings: (BuildContext context) => UserSettings(),
  };
}
