import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/bloc/task_bloc.dart';
import 'package:task_manager/ui/widgets/task/taskcard/task_card.dart';

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
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskCard(
            id: snapshot.data[index].id,
            title: snapshot.data[index].name,
            description: snapshot.data[index].description,
          );
        },
      ),
    );
  }
}