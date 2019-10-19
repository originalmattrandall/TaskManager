import 'package:flutter/material.dart';
import 'package:task_manager/ui/ui_colors.dart';

class MenuItem extends StatelessWidget{
  final Color backgroundColor;
  final String value;
  final IconData icon;
  final String route;

  MenuItem({this.backgroundColor, this.value, this.icon, this.route});
  
  @override
  Widget build(BuildContext context){
    return GestureDetector(

      onTap: (){
        Navigator.pushNamed(context, route);
      },
      child: Container(
        color: backgroundColor, //change to accentColor
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child:Row(
            children: [
              Text(
                value, //make this a passable varible
                style: TextStyle(
                  fontSize: 20,
                  color: UIColors.offBlue,
                ),
              ),
              Spacer(),
              Icon(
                icon,
                color: UIColors.offBlue,
              ), //Make this a passable object
            ],
          ),
        ),
      ),
    );
  }
}