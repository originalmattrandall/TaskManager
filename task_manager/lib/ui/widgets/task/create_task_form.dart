
import 'package:flutter/material.dart';
import 'package:task_manager/data/bloc/task_bloc.dart';
import 'package:task_manager/data/models/task.dart';

class CreateTaskForm extends StatefulWidget {
  CreateTaskForm({Key key}) : super(key: key);

  _CreateTaskFormState createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {

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

    final double outerContainerWidth = MediaQuery.of(context).size.width*0.86;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: outerContainerWidth,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create a New Task",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 24,
                    ),
                  ),            
                ),
                Form(
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
                            return "-_- Just add a title...";
                          }
                          return null;
                        },
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),

                      TextFormField(
                        minLines: 1,
                        maxLines: 6,
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
                            return "This will help you remember what to do";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(                 
        width: double.infinity,
        height: 40,
        child: MaterialButton(
          color: Colors.lightBlue,
          textColor: Colors.white,
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
          child: Text(
            "Submit"
          ),
        ),
      ),
    );
  }
}