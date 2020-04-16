import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task.dart';
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
          title: Text(
            "Back to List",
          ),
          elevation: 0.0,
        ),
        body: CreateTaskForm(
          title: "Create a New Task",
          taskModel: new TaskModel(),
        ),
      ),
    );
  }
}
