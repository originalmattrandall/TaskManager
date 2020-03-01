import 'package:flutter/material.dart';
import 'package:task_manager/data/bloc/filter_bloc.dart';
import 'package:task_manager/data/bloc/task_bloc.dart';
import 'package:task_manager/data/models/filter.dart';
import 'package:task_manager/data/resources/databasehelpers/filter_db_helper.dart';
import 'package:task_manager/data/resources/databasehelpers/filter_tag_db_helper.dart';
import 'package:task_manager/data/resources/databasehelpers/task_db_helper.dart';
import 'package:task_manager/data/shared_preferences.dart';
import 'package:task_manager/ui/widgets/filter/filter_list.dart';
import 'package:task_manager/ui/widgets/general/primary_fab.dart';
import 'package:task_manager/ui/widgets/task/task_list.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            color: Colors.white,
            child: Center(
              heightFactor: 1,   
              child: FilterList(),
            ),
          ),
          elevation: 0.0,
        ),
        body: TaskList(),
        floatingActionButton: PrimaryFab(),
      ),
    );
  }
}