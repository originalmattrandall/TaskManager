import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/ui/widgets/task/create_task_form.dart';


class EditTask extends StatelessWidget {
  const EditTask({Key key}) : super(key: key);

  // final TaskModel task;

  @override
  Widget build(BuildContext context) {

    final TaskModel task = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Back to List",
          ),
          elevation: 0.0,
        ),
        body: CreateTaskForm(
          title: "Edit Task",
          taskModel: task,
        ),
      ),
    );
  }
}
