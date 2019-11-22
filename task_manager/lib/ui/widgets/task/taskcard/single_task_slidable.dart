import 'package:flutter/material.dart';
import 'package:task_manager/data/bloc/task_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_manager/ui/widgets/task/taskcard/single_task.dart';

// Shout out to https://github.com/letsar
// Made an awesome widget for slidable menus: flutter_slidable

class SlidableSingleTask extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final DateTime date;

  SlidableSingleTask({Key key, this.id, this.title, this.description, this.date}) : super(key: key);

  _SlidableSingleTaskState createState() => _SlidableSingleTaskState();
}

class _SlidableSingleTaskState extends State<SlidableSingleTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.16,     
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: SingleTask(
            id: widget.id,
            title: widget.title,
            description: widget.description,
            date: widget.date
          ),
        ),
        secondaryActions: [
          IconSlideAction(
            foregroundColor: Colors.blue,
            caption: "Delete",
            iconWidget: Icon(
              Icons.delete, 
              color: Colors.blue,
            ),
            onTap: () => taskBloc.deleteSingleTask(widget.id),
          ),
        ],
      ),
    );
  }
}