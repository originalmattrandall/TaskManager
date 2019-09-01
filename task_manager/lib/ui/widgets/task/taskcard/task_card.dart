import 'package:flutter/material.dart';
import 'package:task_manager/ui/ui_colors.dart';

class TaskCard extends StatefulWidget {

  final String title;
  final String description;
  final DateTime date;

  TaskCard({Key key, this.title, this.description, this.date}) : super(key: key);

  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[
                Container( 
                  color: UIColors.subMenuBlue,                           
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            widget.description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                widget.date.toString(), //Format the Date
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white54,
                                ),
                              ),
                              Icon( //Placeholder for alert icon
                                Icons.add_alert,
                                color: Colors.blue,
                              ),
                            ], 
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: InkResponse(
                        onTap: (){
                          print("Open Task");
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: UIColors.offBlue,
                          ),
                          child: Icon(
                            Icons.short_text,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: InkResponse(
                        onTap: (){
                          print("Delete Task");
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: UIColors.offBlue,
                          ),
                          child: Icon(
                            Icons.remove_circle_outline,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: InkResponse(
                        onTap: (){
                          print("Mark Task Complete");
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: UIColors.offBlue,
                          ),
                          child: Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),                    
        ],
      )
    );
  }
}