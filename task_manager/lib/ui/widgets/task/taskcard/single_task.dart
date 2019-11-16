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
  bool isComplete = false;

  @override
  Widget build(BuildContext context) {
    
    final double outerContainerWidth = MediaQuery.of(context).size.width*0.8;

    return Container(
      width: outerContainerWidth,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      isComplete = !isComplete;
                    });
                  },
                  icon: Icon(
                    isComplete ? Icons.check_box : Icons.check_box_outline_blank,
                    color: Colors.lightBlue,
                    ),
                ),
              ),
            ],
          ),
          Container(
            width: outerContainerWidth,
            child: Column(
              children: [
                Align( // The Title of the to do item
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(widget.title),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
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