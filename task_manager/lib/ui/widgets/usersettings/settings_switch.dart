import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/ui/themes/theme_model.dart';

class SettingsSwitch extends StatefulWidget {
  final String title;
  final Future future;
  final Function function;

  SettingsSwitch({Key key, @required this.title, this.future, this.function})
      : super(key: key);

  _SettingsSwitchState createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsSwitch> {
  @override
  Widget build(BuildContext context) {
    final double leftAndRightPadding =
        MediaQuery.of(context).size.width * 0.086;

    final primaryColor =
        Provider.of<ThemeModel>(context).currentTheme.backgroundColor;

    return Container(
      alignment: Alignment.topCenter,
      padding:
          EdgeInsets.fromLTRB(leftAndRightPadding, 10, leftAndRightPadding, 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            FutureBuilder(
              future: widget.future,
              initialData: true,
              builder: (context, snapshot) {
                return Switch(
                  activeColor: primaryColor,
                  value: snapshot.data,
                  onChanged: widget.function,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
