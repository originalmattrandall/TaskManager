import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/general/filter_dropdown.dart';
import 'package:task_manager/ui/widgets/general/search_bar.dart';
import 'package:task_manager/ui/widgets/general/mainmenu/menu_drawer.dart';
import 'package:task_manager/ui/widgets/task/task_list.dart';

class HomeList extends StatefulWidget {
  HomeList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SearchBar(),
          elevation: 0.0,          
        ),
        drawer: MenuDrawer(),
        body: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Column(
            children: [
              FilterDropdown(),
              Expanded(
                child: TaskList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}