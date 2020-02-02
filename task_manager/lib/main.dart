import 'package:flutter/material.dart';
import 'package:task_manager/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      initialRoute: '/',
      routes: Routes.routes,
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        accentColor: Colors.lightBlue[300],
        backgroundColor: Colors.white,
        hintColor: Colors.lightBlue[100],
      ),
    );
  }
}
