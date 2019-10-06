import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/bloc/task_bloc.dart';

class TaskList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    taskBloc.fetchAllTasks();
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: StreamBuilder(
        stream: taskBloc.allTasks,
        builder: (context, AsyncSnapshot<List<TaskModel>> snapshot){
          if(snapshot.hasData){
            return buildList(snapshot);
          }
          return Center(child: CircularProgressIndicator());
        },
      )
    );
  }

  Widget buildList(AsyncSnapshot<List<TaskModel>> snapshot){
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(snapshot.data[index].name);
      },
    );
  }
}