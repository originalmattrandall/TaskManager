import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/general/mainmenu/menu_item.dart';

class MenuDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
        children:[
          MenuItem(value: "one", icon: Icons.keyboard_arrow_down, backgroundColor: Theme.of(context).accentColor,),
          MenuItem(value: "two", icon: Icons.keyboard_arrow_down, backgroundColor: Colors.amber),
          MenuItem(value: "three", icon: Icons.keyboard_arrow_down,backgroundColor: Theme.of(context).accentColor ),
        ],
      ),
    );
  }
}