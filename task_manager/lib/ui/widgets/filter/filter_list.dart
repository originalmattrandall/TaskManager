import 'package:flutter/material.dart';
import 'package:task_manager/data/bloc/filter_bloc.dart';
import 'package:task_manager/data/bloc/task_bloc.dart';
import 'package:task_manager/data/models/filter.dart';
import 'package:task_manager/data/shared_preferences.dart';

class FilterList extends StatefulWidget {
  FilterList({Key key}) : super(key: key);

  @override
  _FilterListState createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  
  String _currentFilter = "All Tasks";
  @override
  Widget build(BuildContext context) {
    filterBloc.fetchAllFilters();
    return StreamBuilder(
      stream: filterBloc.allFilters,
      builder: (BuildContext context, AsyncSnapshot<List<Filter>> snapshot) {
        if(snapshot.hasData){
          return DropdownButtonFormField<String>(
            decoration: InputDecoration(
              contentPadding: EdgeInsetsGeometry.lerp(EdgeInsets.all(0), EdgeInsets.all(1), 10),                          
            ),
            value: _currentFilter,
            items: buildList(context, snapshot.data),
            onChanged: (String selectedFilter){
              setState(() {
                _currentFilter = selectedFilter;
                taskBloc.fetchAllTasksByTags(selectedFilter);
              });
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  List<DropdownMenuItem<String>> buildList(BuildContext context, List<Filter> filters){
    return createFilterList(filters).map((String item){
      return DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
          ),
        ),
      );
    }).toList();
  }

  List<String> createFilterList(List<Filter> filters){
    var listItems = new List<String>();
    filters.forEach((filter) => listItems.add(filter.name));
    return listItems;
  }
}