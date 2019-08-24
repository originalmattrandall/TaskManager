import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/general/search_bar.dart';
import 'package:task_manager/ui/widgets/general/mainmenu/menu_drawer.dart';
import 'package:task_manager/ui/ui_colors.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //These Values will come from the database later on
  var _listItems = ["Show all Tasks and Groups", "All Tasks", "All Groups"];
  String _currentFilter = "Show all Tasks and Groups";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SearchBar(),
          elevation: 0.0,          
        ),
        drawer: MenuDrawer(),
        body: Column(
          children: [
            Theme( //TODO: Move this to its own widget class
              data: Theme.of(context).copyWith(
                canvasColor: UIColors.subMenuBlue
              ),
              child: Container(
                color: UIColors.subMenuBlue,
                child: Center(
                  heightFactor: 1,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsetsGeometry.lerp(EdgeInsets.all(0), EdgeInsets.all(1), 10),
                    ),
                    value: _currentFilter, //Value must exist in the list or it throws an error
                    items: _listItems.map((String item){
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String selectedFilter){
                      setState(() {
                        _currentFilter = selectedFilter;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}