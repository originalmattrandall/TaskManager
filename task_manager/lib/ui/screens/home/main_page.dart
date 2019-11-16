import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/general/primary_fab.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Title"),
          elevation: 0.0,          
        ),
        body: Text("body"),
        floatingActionButton: PrimaryFab(
          icon: Icons.menu,
        ),
      ),
    );
  }
}