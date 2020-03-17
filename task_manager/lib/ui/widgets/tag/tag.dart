import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({Key key, this.value}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Theme.of(context).accentColor
      ),
      padding: EdgeInsets.fromLTRB(5.0, 1, 5.0, 1),
      child: Text(
        value,          
        style: TextStyle(
            color: Colors.white,
          ),
      )      
    );
  }

  Widget getTagWidgets(List<String> tags){
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      spacing: 5,
      runSpacing: 5,
      children: 
        tags.map(
          (tag) => Tag(
            value: tag
        )).toList()
    );
  }
}