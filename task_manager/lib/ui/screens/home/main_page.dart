import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/general/filter_dropdown.dart';
import 'package:task_manager/ui/widgets/general/primary_fab.dart';
import 'package:task_manager/ui/widgets/group/group_list.dart';
import 'package:task_manager/ui/widgets/task/task_list.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var _listItems = ["All Tasks"];
  String _currentFilter = "All Tasks";

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
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding: EdgeInsetsGeometry.lerp(EdgeInsets.all(0), EdgeInsets.all(1), 10),                          
                ),
                value: _currentFilter, //Value must exist in the list or it throws an error
                items: _listItems.map((String item){
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 18,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String selectedFilter){
                  setState(() {
                    _currentFilter = selectedFilter;                  
                  });
                },
              ),
            ),
          ),
          elevation: 0.0,
        ),
        body: buildBody(),
        floatingActionButton: PrimaryFab(),
      ),
    );
  }

  Widget buildBody(){
    Widget child = TaskList();

    return child;
  }
}