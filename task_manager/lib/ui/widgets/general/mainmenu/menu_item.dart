import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget{
  final Color backgroundColor;
  final String value;
  final IconData icon;

  MenuItem({this.backgroundColor, this.value, this.icon});
  
  @override
  Widget build(BuildContext context){
    return Container(
      color: backgroundColor, //change to accentColor
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Row(
          children: [
            Text(
              value, //make this a passable varible
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Spacer(),
            Icon(icon), //Make this a passable object
          ],
        )
      )
    );
  }
}