import 'package:flutter/material.dart';

class SettingsSwitch extends StatefulWidget {
  final String title;
  final Future future;
  final Function function;
  SettingsSwitch({Key key, @required this.title, @required this.future, @required this.function}) : super(key: key);

  _SettingsSwitchState createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsSwitch> {

  @override
  Widget build(BuildContext context) {

    final double leftAndRightPadding = MediaQuery.of(context).size.width*0.086;

    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.fromLTRB(leftAndRightPadding, 10, leftAndRightPadding, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          FutureBuilder(
            future: widget.future,
            initialData: false,
            builder: (context, snapshot){
              return Switch(
                activeColor: Theme.of(context).primaryColor,
                value: snapshot.data,
                onChanged: widget.function
              );
            },
          ),
        ],
      ),
    );
  }
}