import 'package:flutter/material.dart';
import 'package:task_manager/data/bloc/group_bloc.dart';
import 'package:task_manager/data/models/group.dart';

class GroupList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    groupBloc.fetchAllGroups(); // Used to load the initial list
    return Material(
      child: StreamBuilder(
        stream: groupBloc.allTasks,
        builder: (context, AsyncSnapshot<List<GroupModel>> snapshot){
          if(snapshot.hasData){
            return buildList(context, snapshot);
          }
          return Center(child: CircularProgressIndicator());
        },
      )
    );
  }

  Widget buildList(BuildContext context, AsyncSnapshot<List<GroupModel>> snapshot){
    return Container(
      color: Colors.white,
      child: snapshot.data.isEmpty
        ? Center( child: Text(
          "Add your first task!",
          style: TextStyle(color: Colors.grey),
          )) 
        : ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(
            snapshot.data[index].id.toString() + 
            snapshot.data[index].name + 
            snapshot.data[index].description,
          );
        },
        padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
      ),
    );
  }
}