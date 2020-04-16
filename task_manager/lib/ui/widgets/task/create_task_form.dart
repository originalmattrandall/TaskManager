import 'package:flutter/material.dart';
import 'package:task_manager/data/bloc/task_bloc.dart';
import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/resources/databasehelpers/tags_db_helper.dart';
import 'package:task_manager/data/resources/databasehelpers/task_tag_db_helper.dart';
import 'package:task_manager/ui/widgets/tag/tag.dart';

class CreateTaskForm extends StatefulWidget {
  final String title;
  final TaskModel taskModel;

  CreateTaskForm({Key key, this.title, this.taskModel}) : super(key: key);

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

  var tagsFuture;

  @override
  void initState() {
    if (widget.taskModel.id != null) {
      tagsFuture = getTags();
    }
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _tagListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // If the task passed in is not null, populate the text boxes
    if (widget.taskModel.id != null) {
      _titleController.text = widget.taskModel.name;
      _descriptionController.text = widget.taskModel.description;
    }

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
                    widget.title, // "Create a New Task",
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
                                style: TextStyle(color: backgroundColor),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: 30),
                      ),

                      tagsListBuilder(),

                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
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
              var taskResult;

              TaskModel insertThisTask = TaskModel(
                name: _titleController.text,
                description: _descriptionController.text,
              );

              if (widget.taskModel.id != null) {
                print(widget.taskModel.id);
                insertThisTask.id = widget.taskModel.id;

                taskResult = taskBloc.updateSingleTask(insertThisTask);
              } else {
                taskResult = taskBloc.insertSingleTask(insertThisTask);
              }

              taskResult.then((id) {
                for (var tag in tagsForThisTask) {
                  if (tag.isNotEmpty) {
                    var tagRow = {TagDBHelper.name: tag};

                    _tagDbHelper.upsert(tagRow).then((value) {
                      var taskTagRow = {
                        TaskTagDbHelper.tagId: value,
                        TaskTagDbHelper.taskId: id
                      };
                      print(taskTagRow);
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

  Widget tagsListBuilder() {
    if (widget.taskModel.id != null) {
      return FutureBuilder(
        future: tagsFuture,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Tag().getTagWidgets(snapshot.data);
          } else {
            return LinearProgressIndicator();
          }
        },
      );
    } else {
      return Container();
    }
  }

  Future getTags() async {
    List<String> tags = new List<String>();

    _tagTaskDbHelper.queryByTaskId(widget.taskModel.id).then((value) {
      var ids = new List<int>();
      for (var tag in value) {
        ids.add(tag[TaskTagDbHelper.tagId]);
      }

      _tagDbHelper.queryByIds(ids).then((value) {
        for (var tag in value) {
          tags.add(tag[TagDBHelper.name]);
        }
      });
    });

    return tags;
  }
}
