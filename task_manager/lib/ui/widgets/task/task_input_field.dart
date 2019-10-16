import 'package:flutter/material.dart';

class TaskInputField extends StatefulWidget {

  final TextEditingController controller;

  TaskInputField({Key key, this.controller}) : super(key: key);

  _TaskInputFieldState createState() => _TaskInputFieldState();
}

class _TaskInputFieldState extends State<TaskInputField> {
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder inputBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white)
    );

    return TextField(                  
      style: TextStyle(
        color: Colors.white,
        decoration: TextDecoration.none
      ),
      controller: widget.controller,        
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white24),
        labelText: "Title",
        hintText: "Title of the Task",
        enabledBorder: inputBorder,
        focusedBorder: inputBorder
      ),
    );
  }
}