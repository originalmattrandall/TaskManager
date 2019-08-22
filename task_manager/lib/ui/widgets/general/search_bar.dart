import 'package:flutter/material.dart';
import 'package:task_manager/ui/ui_colors.dart';

class SearchBar extends StatefulWidget{
  @override
  SearchBarState createState(){
    return new SearchBarState();
  }
}

class SearchBarState extends State<SearchBar>{
  @override
  Widget build(BuildContext context){
    return TextField(
      style: TextStyle(
        color: Colors.white,
      ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        prefixIcon: Icon(
            Icons.search,
            color: UIColors.offBlue[100],
          ),
        hintText: "Search...",
        hintStyle: TextStyle(
          color: UIColors.offBlue[100]
        ),
        filled: true,
        fillColor: Theme.of(context).accentColor,              
      ),
    );
  }
}