import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/bloc/task_bloc.dart';
import 'package:task_manager/ui/widgets/task/taskcard/single_task.dart';

class TaskList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    taskBloc.fetchAllTasks();
    return Material(
      child: StreamBuilder(
        stream: taskBloc.allTasks,
        builder: (context, AsyncSnapshot<List<TaskModel>> snapshot){
          if(snapshot.hasData){
            return buildList(context, snapshot);
          }
          return Center(child: CircularProgressIndicator());
        },
      )
    );
  }

  Widget buildList(BuildContext context, AsyncSnapshot<List<TaskModel>> snapshot){
    return Container(
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return SingleTask( // This will need to be converted into a widget that returns TaskCards based on filter selected
            // ?? returns defaults when the values are null coming from the DB
            id: snapshot.data[index].id,
            title: snapshot.data[index].name ?? "",
            description: snapshot.data[index].description ?? "",
          );
        },
      ),
    );
  }
}