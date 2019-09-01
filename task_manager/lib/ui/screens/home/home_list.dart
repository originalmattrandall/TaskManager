import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/general/filter_dropdown.dart';
import 'package:task_manager/ui/widgets/general/search_bar.dart';
import 'package:task_manager/ui/widgets/general/mainmenu/menu_drawer.dart';
import 'package:task_manager/ui/widgets/task/taskcard/task_card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              TaskCard(
                title: "test",
                description: "Description of the task or thing someone is trying to keep track of.",
                date: DateTime.now(),
              ),                       
            ],
          ),
        ),
      ),
    );
  }
}