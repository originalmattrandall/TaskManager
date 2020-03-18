import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/data/resources/databasehelpers/task_tag_db_helper.dart';
import 'package:task_manager/ui/themes/light_blue_theme.dart';
import 'package:task_manager/ui/themes/theme_model.dart';
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
  final taskTagDbHelper = new TaskTagDbHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Container(
            child: Center(
              heightFactor: 1,
              child: FilterList(),
            ),
          ),
        ),
        body: TaskList(),
        floatingActionButton: PrimaryFab(),
      ),
    );
  }  
}
