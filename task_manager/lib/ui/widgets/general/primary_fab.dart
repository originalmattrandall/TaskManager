import 'package:flutter/material.dart';
import 'package:task_manager/routes.dart';

class PrimaryFab extends StatefulWidget {
  final Function() onPressed;
  final String toolTip;
  final IconData icon;

  PrimaryFab({Key key, this.onPressed, this.toolTip, this.icon}) : super(key: key);

  _PrimaryFabState createState() => _PrimaryFabState();
}

class _PrimaryFabState extends State<PrimaryFab> with SingleTickerProviderStateMixin{
  bool isOpened = false;
  AnimationController _animationController;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {
            });
          });

    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);


    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose(){
    _animationController.dispose();
    super.dispose();
  }

  animate(){
    if(!isOpened){
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget newTask(){
    return Container(
      child: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () =>  Navigator.pushNamed(context, Routes.createTask),
        tooltip: 'Create a new todo item',
        child: Icon(
          Icons.library_add,
          color: Colors.white
          ),
        mini: true,
        heroTag: 'NewTaskButton',
      )
    );
  }

  Widget newFilter(){
    return Container(
      child: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () =>  Navigator.pushNamed(context, Routes.createFilter),
        tooltip: 'Create a new filter',
        child: Icon(
          Icons.library_books,
          color: Colors.white,
          ),
        mini: true,
        heroTag: 'NewFilterButton',
      )
    );
  }

  Widget userSettings(){
    return Container(
      child: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () =>  Navigator.pushNamed(context, Routes.userSettings),
        tooltip: 'Go to user settings',
        child: Icon(
          Icons.settings,
          color: Colors.white,
        ),
        
        mini: true,
        heroTag: 'UserSettingsButton',
      )
    );
  }

  Widget toggle(){
    return Container(
      child: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: animate,
        tooltip: 'Open/Close Menu',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
          color: Colors.white,
        ),
        heroTag: 'NewToggleButton',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Transform(
          transform: Matrix4.translationValues(
            0, 
            _translateButton.value * 2.54, 
            0.0
          ),
          child: newTask(),
        ),

        Transform(
          transform: Matrix4.translationValues(
            0.0, 
            _translateButton.value * 1.65,
            0.0
          ),
          child: newFilter(),
        ),

        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0
          ),
          child: userSettings(),
        ),

        toggle(),
      ],
    );
  }
}