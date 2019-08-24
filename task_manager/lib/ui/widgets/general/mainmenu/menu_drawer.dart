import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/general/mainmenu/menu_item.dart';
import 'package:task_manager/ui/ui_colors.dart';

class MenuDrawer extends StatelessWidget{

  final List<String> list = ["Task", "Group", "Rank"];

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Container( 
        color: Theme.of(context).primaryColor,
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
          children:[
            Container(
              color: Theme.of(context).accentColor,
              child: ExpansionTile(
                title: Text(
                  "Create",
                  style: TextStyle(
                    fontSize: 24,
                    color: UIColors.offBlue,
                  )
                ),
                children:[
                  MenuItem(value: "Task", icon: Icons.add_circle_outline, backgroundColor: UIColors.subMenuBlue ),
                  MenuItem(value: "Group", icon: Icons.add_circle_outline, backgroundColor: UIColors.subMenuBlue ),
                  MenuItem(value: "Filter", icon: Icons.add_circle_outline, backgroundColor: UIColors.subMenuBlue ),
                  MenuItem(value: "Priority", icon: Icons.add_circle_outline, backgroundColor: UIColors.subMenuBlue ),           
                ],
              ),
            ),
            Container(
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