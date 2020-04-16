import 'package:flutter/material.dart';
import 'package:task_manager/data/resources/databasehelpers/tags_db_helper.dart';
import 'package:task_manager/ui/widgets/filter/create_filter_form.dart';

class CreateFilter extends StatefulWidget {
  CreateFilter({Key key}) : super(key: key);

  _CreateFilterState createState() => _CreateFilterState();
}

class _CreateFilterState extends State<CreateFilter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey,
          ),
          title: Text(
              "Back to List",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              )
            ),
          elevation: 0.0,
        ),
        body: CreateFilterForm(),
        ),
    );
  }
}