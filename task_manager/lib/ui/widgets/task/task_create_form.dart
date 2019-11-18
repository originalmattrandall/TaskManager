
import 'package:flutter/material.dart';
import 'package:task_manager/data/bloc/task_bloc.dart';
import 'package:task_manager/data/models/task.dart';

class TaskCreateForm extends StatefulWidget {
  TaskCreateForm({Key key}) : super(key: key);

  _TaskCreateFormState createState() => _TaskCreateFormState();
}

class _TaskCreateFormState extends State<TaskCreateForm> {

  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  UnderlineInputBorder underLineBorder = const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlue
    )
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Form(
            key: _formKey,            
            child: Column(              
              children: [
                TextFormField(
                  controller: _titleController,
                  style: TextStyle(
                    color: Colors.lightBlue,
                    decoration: TextDecoration.none
                  ),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.lightBlue),
                    hintStyle: TextStyle(color: Colors.lightBlue[100]),
                    labelText: "Title",
                    hintText: "Title of the Task",
                    enabledBorder: underLineBorder,
                    focusedBorder: underLineBorder,
                    errorBorder: underLineBorder,
                    focusedErrorBorder: underLineBorder
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter a title";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextFormField(
                    controller: _descriptionController,
                    style: TextStyle(
                      color: Colors.lightBlue,
                      decoration: TextDecoration.none
                    ),
                    decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.lightBlue),
                    hintStyle: TextStyle(color: Colors.lightBlue[100]),
                      labelText: "Description",
                      hintText: "Descrption of the task",
                      enabledBorder: underLineBorder,
                      focusedBorder: underLineBorder,
                      errorBorder: underLineBorder,
                      focusedErrorBorder: underLineBorder
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter a description";
                      }
                      return null;
                    },
                  ),
                ),
                // Another textfield for description
                RaisedButton(
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                      TaskModel insertThisTask = TaskModel(
                        name: _titleController.text,
                        description: _descriptionController.text,
                      );
                      taskBloc.insertSingleTask(insertThisTask);
                      _titleController.clear();
                      _descriptionController.clear();
                      Navigator.pop(context);
                    }
                  },
                ),
                Container(
                  
                )
              ],
            ),
            ),
          ),
        ),
    );
  }
}