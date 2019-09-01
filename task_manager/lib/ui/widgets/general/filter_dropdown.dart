import 'package:flutter/material.dart';
import 'package:task_manager/ui/ui_colors.dart';

class FilterDropdown extends StatefulWidget {
  FilterDropdown({Key key}) : super(key: key);

  _FilterDropdownState createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {

  //These Values will come from the database later on
  var _listItems = ["Show all Tasks and Groups", "All Tasks", "All Groups"];
  String _currentFilter = "Show all Tasks and Groups";

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: UIColors.subMenuBlue
        ),
        child: Container(
          color: UIColors.subMenuBlue,
          child: Center(
            heightFactor: 1,            
            child: DropdownButtonFormField<String>( //TODO: Change the dropdown icon
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
                      color: Colors.white,
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
      ),
    );
  }
}