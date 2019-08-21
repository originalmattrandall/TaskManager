import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget{
  @override
  MenuDrawerState createState(){
    return new MenuDrawerState();
  }
}

class MenuDrawerState extends State<MenuDrawer>{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Item 1")
          )
        ]
      )
    );
  }
}