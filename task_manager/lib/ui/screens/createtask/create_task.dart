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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SearchBar(),
          elevation: 0.0,          
        ),
        drawer: MenuDrawer(),
        body: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Column(
            children: [
              Container(
                width: double.infinity,
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Text(
                    "Create a New Task",
                    style: TextStyle(color: Colors.white, fontSize: 18)
                  ),
                )
              ),
              TaskCreateForm(),
            ],
          ),
        ),
      ),
    );
  }
}