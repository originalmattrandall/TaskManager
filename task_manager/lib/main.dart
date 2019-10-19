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
        primaryColor: Color.fromRGBO(0, 35, 67, 1),
        accentColor: Color.fromRGBO(0, 62, 120, 1),
        backgroundColor: Color.fromRGBO(0, 35, 67, 1),
      ),      
    );
  }
}
