import 'package:flutter/material.dart';
import 'package:task_manager/data/bloc/task_bloc.dart';
import 'package:task_manager/data/resources/databasehelpers/task_db_helper.dart';

class SingleTask extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final DateTime date;
  final int isComplete;

  SingleTask({Key key, this.id, this.title, this.description, this.date, this.isComplete}) : super(key: key);

  _SingleTaskState createState() => _SingleTaskState();
}

class _SingleTaskState extends State<SingleTask> {

  @override
  Widget build(BuildContext context) {

    bool taskCompleted = widget.isComplete == 1;

    final double outerContainerWidth = MediaQuery.of(context).size.width*0.8;

    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
      width: outerContainerWidth,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      taskCompleted = !taskCompleted;
                      Map<String, dynamic> row = {
                        TaskDBHelper.id : widget.id,
                        TaskDBHelper.isComplete : taskCompleted
                      };
                      
                      taskBloc.updateSingleTask(row);
                    });
                  },
                  icon: Icon(
                    taskCompleted ? Icons.check_box : Icons.check_box_outline_blank,
                    color: Colors.lightBlue,
                    ),
                ),
              ),
            ],
          ),
          Expanded(
          child: Container(
            width: outerContainerWidth,
            child: Column(
              children: [
                Align( // The Title of the to do item
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        decoration: taskCompleted ? TextDecoration.lineThrough : null,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                ),

                Align( // The Description of the to do item
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      widget.description,                      
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: taskCompleted ? TextDecoration.lineThrough : null,
                      ),
                    )
                  ),
                ),
              ],
            )
          )
          )
        ]
      )
    );
  }
}