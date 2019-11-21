import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/task/create_task_form.dart';

class CreateTask extends StatefulWidget {
  CreateTask({Key key}) : super(key: key);

  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey,
          ),
          title: Text(
              "Task list",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              )
            ),
          elevation: 0.0,    
          backgroundColor: Colors.white,
        ),
        body: CreateTaskForm(),
        ),
    );
  }
}