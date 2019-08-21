import 'package:flutter/material.dart';
import 'ui/screens/home/home_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      home: MyHomePage(title: 'To Do App'),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 35, 67, 1),
        accentColor: Color.fromRGBO(0, 62, 120, 1),
        backgroundColor: Color.fromRGBO(0, 35, 67, 1),
      ),      
    );
  }
}
