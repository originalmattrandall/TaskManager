import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/ui/themes/theme_model.dart';

class Tag extends StatelessWidget {
  const Tag({Key key, this.value}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    Color primaryColor =
        Provider.of<ThemeModel>(context).currentTheme.primaryColor;

    Color backGroundColor =
        Provider.of<ThemeModel>(context).currentTheme.backgroundColor;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: primaryColor,
      ),
      padding: EdgeInsets.fromLTRB(5.0, 1, 5.0, 1),
      child: Text(
        value,
        style: TextStyle(
          color: backGroundColor,
        ),
      ),
    );
  }

  Widget getTagWidgets(List<String> tags) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      spacing: 5,
      runSpacing: 5,
      children: tags.map((tag) => Tag(value: tag)).toList(),
    );
  }
}
