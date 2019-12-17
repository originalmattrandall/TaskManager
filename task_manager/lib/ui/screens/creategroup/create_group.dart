import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/group/create_group_form.dart';

class CreateGroup extends StatelessWidget {
  const CreateGroup({Key key}) : super(key: key);

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
          backgroundColor: Colors.white,
        ),
        body: CreateGroupForm(),
        ),
    );
  }
}