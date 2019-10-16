import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/general/search_bar.dart';
import 'package:task_manager/ui/widgets/general/mainmenu/menu_drawer.dart';
import 'package:task_manager/ui/widgets/task/task_input_field.dart';

class CreateTask extends StatefulWidget {
  CreateTask({Key key}) : super(key: key);

  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {

    final _text = TextEditingController();
    
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
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: TaskInputField(
                  controller: _text
                ),
              ),
              RaisedButton( // Will become the submit button
                onPressed: (){
                  setState(() {
                    // Make call to add task to DB here
                    // Then return to home_list
                    _text.text.isEmpty ? print("empty") : print(_text.value);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}