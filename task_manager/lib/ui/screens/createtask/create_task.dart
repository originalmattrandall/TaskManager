import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/general/search_bar.dart';
import 'package:task_manager/ui/widgets/general/mainmenu/menu_drawer.dart';
import 'package:task_manager/ui/widgets/task/task_create_form.dart';

class CreateTask extends StatefulWidget {
  CreateTask({Key key}) : super(key: key);

  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {

    final double outerContainerWidth = MediaQuery.of(context).size.width*0.86;

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
        body: Scaffold(
          //backgroundColor: Theme.of(context).primaryColor,
          body: SingleChildScrollView(
            child: Column(
            children: [
              Container(
                width: outerContainerWidth,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create a new task",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 24,
                  ),
                ),
              ),
              TaskCreateForm(),
            ],
          ),
          ),
        ),
      ),
    );
  }
}