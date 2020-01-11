import 'package:flutter/material.dart';
import 'package:task_manager/data/bloc/task_bloc.dart';
import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/resources/databasehelpers/task_db_helper.dart';

class SingleTask extends StatefulWidget {
  final TaskModel task;

  SingleTask({Key key, this.task}) : super(key: key);

  _SingleTaskState createState() => _SingleTaskState();
}

class _SingleTaskState extends State<SingleTask> {

  @override
  Widget build(BuildContext context) {

    bool taskCompleted = widget.task.isComplete == 1;

    final double outerContainerWidth = MediaQuery.of(context).size.width*0.8;

  return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
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
                        TaskDBHelper.id : widget.task.id,
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
                      widget.task.name,
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
                      widget.task.description,                      
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: taskCompleted ? TextDecoration.lineThrough : null,
                      ),
                    )
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: getTagWidgets(widget.task.tags),
                )

              ],
            )
          )
          )
        ]
      )
    );
  }

  Widget getTagWidgets(List<String> tags){
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      spacing: 5,
      runSpacing: 5,
      children: 
        tags.map((tag) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Theme.of(context).accentColor
          ),
          padding: EdgeInsets.fromLTRB(5.0, 1, 5.0, 1),
          child: Text(
            tag,          
            style: TextStyle(
                color: Colors.white,
                //backgroundColor: Theme.of(context).accentColor,
              ),
          )
      )).toList()      
    );
  }
}