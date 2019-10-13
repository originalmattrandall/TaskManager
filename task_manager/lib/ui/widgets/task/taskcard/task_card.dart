import 'package:flutter/material.dart';
import 'package:task_manager/data/bloc/task_bloc.dart';
import 'package:task_manager/ui/ui_colors.dart';
import 'package:task_manager/ui/widgets/general/card_menu_button.dart';

class TaskCard extends StatefulWidget {

  final int id;
  final String title;
  final String description;
  final DateTime date;

  TaskCard({Key key, this.id, this.title, this.description, this.date}) : super(key: key);

  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {

  IconData completeIcon = Icons.check_box_outline_blank;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
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
                          child: CardMenuButton(
                            icon: Icons.short_text,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: InkResponse(
                          onTap: (){
                            print("Delete Task");
                            taskBloc.deleteSingleTask(widget.id);
                          },
                          child: CardMenuButton(
                            icon: Icons.delete,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: InkResponse(
                          onTap: (){
                            print("Mark Task Complete");
                            setState(() {
                              // This should toggle based on the data in the DB
                              completeIcon = Icons.check_box;
                            });
                          },
                          child: CardMenuButton(
                            icon: completeIcon,
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