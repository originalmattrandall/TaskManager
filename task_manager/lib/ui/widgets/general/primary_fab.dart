import 'package:flutter/material.dart';

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
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.lightBlue[300],
      end: Colors.lightBlue,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
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
        onPressed: null,
        tooltip: 'Create a new todo item',
        child: Icon(Icons.mic),
        mini: true,
      )
    );
  }

  Widget newGroup(){
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Create a new group',
        child: Icon(Icons.mode_edit),
        mini: true,
      )
    );
  }

  Widget newFilter(){
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Create a new filter',
        child: Icon(Icons.music_video),
        mini: true,
      )
    );
  }

  Widget toggle(){
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Open/Close Menu',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ), 
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
            0.0, 
            _translateButton.value * 2.7, 
            0.0
          ),
          child: newTask(),
        ),

        Transform(
          transform: Matrix4.translationValues(
            0.0, 
            _translateButton.value * 1.7, 
            0.0
          ),
          child: newGroup(),
        ),

        Transform(
          transform: Matrix4.translationValues(
            0.0, 
            _translateButton.value, 
            0.0
          ),
          child: newFilter(),
        ),

        toggle(),
      ],
    );
  }
}