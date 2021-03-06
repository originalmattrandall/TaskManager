import 'package:flutter/material.dart';
import 'package:task_manager/data/bloc/task_bloc.dart';
import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/resources/databasehelpers/tags_db_helper.dart';
import 'package:task_manager/data/resources/databasehelpers/task_tag_db_helper.dart';
import 'package:task_manager/ui/widgets/tag/tag.dart';

class CreateTaskForm extends StatefulWidget {
  CreateTaskForm({Key key}) : super(key: key);

  _CreateTaskFormState createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tagListController = TextEditingController();

  final _tagDbHelper = TagDBHelper();
  final _tagTaskDbHelper = TaskTagDbHelper();

  var tagsForThisTask = new List<String>();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _tagListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final backgroundColor = Theme.of(context).backgroundColor;

    final double outerContainerWidth = MediaQuery.of(context).size.width * 0.86;

    var inputDecoration = (String label, String hint) => new InputDecoration(
          labelText: label,
          hintText: hint,
        );

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
                          decoration: TextDecoration.none,
                        ),
                        decoration: inputDecoration(
                          "Title",
                          "Title of the Task",
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
                          decoration: TextDecoration.none,
                        ),
                        decoration: inputDecoration(
                          "Description",
                          "Description of the task",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "This will help you remember what to do";
                          }
                          return null;
                        },
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),

                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: _tagListController,
                              decoration: inputDecoration(
                                "Tags",
                                "Dont forget to click Add Tag",
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: FlatButton(
                              color: primaryColor,
                              onPressed: () {
                                setState(() {
                                  tagsForThisTask
                                      .add(_tagListController.value.text);
                                  _tagListController.clear();
                                });
                              },
                              child: Text(
                                "Add Tag",
                                style: TextStyle(
                                  color: backgroundColor
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: 30),
                      ),

                      // TODO: Improvement opportunity - Make the tags removable when creating a task
                      Tag().getTagWidgets(tagsForThisTask),
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
          color: primaryColor,
          textColor: backgroundColor,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              TaskModel insertThisTask = TaskModel(
                name: _titleController.text,
                description: _descriptionController.text,
              );

              var taskResult = taskBloc.insertSingleTask(insertThisTask);

              taskResult.then((id) {
                for (var tag in tagsForThisTask) {
                  if (tag.isNotEmpty) {
                    var tagRow = {TagDBHelper.name: tag};

                    _tagDbHelper.upsert(tagRow).then((value) {
                      var taskTagRow = {
                        TaskTagDbHelper.tagId: value,
                        TaskTagDbHelper.taskId: id
                      };
                      _tagTaskDbHelper.insert(taskTagRow);
                    });
                  }
                }

                _titleController.clear();
                _descriptionController.clear();
                Navigator.pop(context);
              });
            }
          },
          child: Text("Submit"),
        ),
      ),
    );
  }
}
