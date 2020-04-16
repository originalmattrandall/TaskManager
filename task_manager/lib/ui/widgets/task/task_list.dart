import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/data/models/task.dart';
import 'package:task_manager/data/bloc/task_bloc.dart';
import 'package:task_manager/ui/themes/theme_model.dart';
import 'package:task_manager/ui/widgets/task/taskcard/single_task_slidable.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    taskBloc.fetchAllTasksByFilter(""); // Used to load the initial list
    return Material(
      child: StreamBuilder(
        stream: taskBloc.allTasks,
        builder: (context, AsyncSnapshot<List<TaskModel>> snapshot) {
          if (snapshot.hasData) {
            return buildList(context, snapshot);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildList(
      BuildContext context, AsyncSnapshot<List<TaskModel>> snapshot) {
    var backgroundColor =
        Provider.of<ThemeModel>(context).currentTheme.scaffoldBackgroundColor;

    return Container(
      color: backgroundColor,
      child: snapshot.data.isEmpty
          ? Center(
              child: Text(
                "Add your first task!",
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return SlidableSingleTask(
                  task: snapshot.data[index],
                );
              },
            ),
    );
  }
}
