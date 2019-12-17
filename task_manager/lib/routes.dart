import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/creategroup/create_group.dart';
import 'package:task_manager/ui/screens/usersettings/user_settings.dart';
import 'package:task_manager/ui/screens/createtask/create_task.dart';
import 'package:task_manager/ui/screens/home/main_page.dart';

class Routes {
  static String homeList = "/";
  static String createTask = "CreateTask";
  static String createGroup = "CreateGroup";
  static String userSettings = "UserSettings";

  static var routes = <String, WidgetBuilder>{
    homeList: (BuildContext context) => MainPage(),
    createTask: (BuildContext context) => CreateTask(),
    createGroup: (BuildContext context) => CreateGroup(),
    userSettings: (BuildContext context) => UserSettings(),
  };
}