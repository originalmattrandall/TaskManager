import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/createtask/create_task.dart';
import 'package:task_manager/ui/screens/home/home_list.dart';
import 'package:task_manager/ui/screens/home/main_page.dart';

class Routes {
  static String homeList = "/";
  static String createTask = "CreateTask";

  static var routes = <String, WidgetBuilder>{
    //homeList: (BuildContext context) => HomeList(),
    homeList: (BuildContext context) => MainPage(),
    createTask: (BuildContext context) => CreateTask()
  };
}