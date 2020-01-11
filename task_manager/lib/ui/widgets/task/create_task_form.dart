import 'package:flutter/material.dart';
import 'package:task_manager/data/bloc/task_bloc.dart';
import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/resources/databasehelpers/tags_db_helper.dart';

class CreateTaskForm extends StatefulWidget {
  CreateTaskForm({Key key}) : super(key: key);

  _CreateTaskFormState createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tagController = TextEditingController();

  final _tagDbHelper = TagDBHelper();

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

                      TextFormField(
                        controller: _tagController,
                        style: TextStyle(
                          color: Colors.lightBlue,
                          decoration: TextDecoration.none
                        ),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.lightBlue),
                          hintStyle: TextStyle(color: Colors.lightBlue[100]),
                          labelText: "Tags",
                          hintText: "Add one or more tags for filtering",
                          enabledBorder: underLineBorder,
                          focusedBorder: underLineBorder,
                          errorBorder: underLineBorder,
                          focusedErrorBorder: underLineBorder
                        ),
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

              var taskResult = taskBloc.insertSingleTask(insertThisTask);

              taskResult.then((id) {
                print(id.toString());

                var tags = _tagController.text.split(new RegExp(r"[^\w]"));

                for(var tag in tags){
                  if(tag.isNotEmpty){
                    var row = {
                      TagDBHelper.taskId : id,
                      TagDBHelper.name : tag
                    };

                    _tagDbHelper.insert(row);
                  }
                }

                _tagController.clear();
                _titleController.clear();
                _descriptionController.clear();
                Navigator.pop(context);
              });
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