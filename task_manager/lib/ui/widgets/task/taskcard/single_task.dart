import 'package:flutter/material.dart';

class SingleTask extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final DateTime date;

  SingleTask({Key key, this.id, this.title, this.description, this.date}) : super(key: key);

  _SingleTaskState createState() => _SingleTaskState();
}

class _SingleTaskState extends State<SingleTask> {
  @override
  Widget build(BuildContext context) {
    final double outerContainerWidth = MediaQuery.of(context).size.width*0.8;

    return Container( 
      padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: Row(
        children: [
          Column(
            children: [
              Icon(Icons.check_box_outline_blank),
            ]
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
            width: outerContainerWidth,
            child: Column(
              children: [
                Align( // The Title of the to do item
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(widget.title),
                  ),
                ),
                Align( // The Description of the to do item
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      widget.description,                      
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )
                  ),
                ),
              ],
            )
          )
        ]
      )
    );
  }
}