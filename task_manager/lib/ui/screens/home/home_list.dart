import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(color: Colors.blue[300]),
              ),
              Expanded( // Settings icon
                flex: 2,
                child: Container(
                  color: Colors.blue[200],
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.settings)
                ),
              ),
              Expanded( // Filter Drop down selection
                flex: 2,
                child: Container(color: Colors.blue[100]),
              ),
            ],
          ),
        ),
        Expanded( // Will Contain the List View
          flex: 4,
          child: ListView(
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              Container(
                height: 50,
                color: Colors.amber[600],
                child: const Center(child: Text('Entry A')),
              ),
              Container(
                height: 50,
                color: Colors.amber[500],
                child: const Center(child: Text('Entry B')),
              ),
              Container(
                height: 50,
                color: Colors.amber[100],
                child: const Center(child: Text('Entry C')),
              ),
            ],
          ),
        )
      ],
    );
  }
}