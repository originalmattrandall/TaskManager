import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/general/mainmenu/menu_item.dart';
import 'package:task_manager/ui/ui_colors.dart';

class MenuDrawer extends StatefulWidget{
  @override
  State createState() => MenuDrawerState();
}

class MenuDrawerState extends State<MenuDrawer>{

  List<String> list = ["Task", "Group", "Rank"];
  IconData iData = Icons.keyboard_arrow_down;

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Container( 
        color: Theme.of(context).primaryColor,
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
          children:[
            Container( //TODO: Move to its own widget class
              color: Theme.of(context).accentColor,
              child: ExpansionTile(
                onExpansionChanged: (context){ 
                  setState(() {
                    context ? iData = Icons.keyboard_arrow_up : iData = Icons.keyboard_arrow_down;
                  });
                },
                trailing: Icon(iData, color: UIColors.offBlue,),
                title: Text(
                    "Create",
                    style: TextStyle(
                      fontSize: 24,
                      color: UIColors.offBlue,
                    ),
                  ),
                children:[
                  MenuItem(value: "Task", icon: Icons.add_circle_outline, backgroundColor: UIColors.subMenuBlue ),
                  MenuItem(value: "Group", icon: Icons.add_circle_outline, backgroundColor: UIColors.subMenuBlue ),
                  MenuItem(value: "Filter", icon: Icons.add_circle_outline, backgroundColor: UIColors.subMenuBlue ),
                  MenuItem(value: "Priority", icon: Icons.add_circle_outline, backgroundColor: UIColors.subMenuBlue ),           
                ],
              ),
            ),
            Container( //TODO: Move to its own widget class
              color: Theme.of(context).accentColor,
              child: ListTile(
                title: Row(
                  children:[
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 24,
                        color: UIColors.offBlue,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.settings,
                      color: UIColors.offBlue,
                    ),
                  ]
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}