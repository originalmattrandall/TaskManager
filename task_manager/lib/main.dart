import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/createtask/create_task.dart';
import 'package:task_manager/ui/screens/home/home_list.dart';
import 'package:task_manager/ui/widgets/task/task_create_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //final task = TaskModel(
    //  name: "hello5",
    //  description: "this will end up as another task i think?"
    //);

    //TaskDBHelper.insert(task);

    //Repository().getAllTasks().then((result) {
    //  for (var task in result){
    //    print(task.name);
    //  }
    //});

    return MaterialApp(
      title: 'Task Manager',
      home: CreateTask(),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 35, 67, 1),
        accentColor: Color.fromRGBO(0, 62, 120, 1),
        backgroundColor: Color.fromRGBO(0, 35, 67, 1),
      ),      
    );
  }
}
