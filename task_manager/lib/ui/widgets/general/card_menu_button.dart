import 'package:flutter/material.dart';
import 'package:task_manager/ui/ui_colors.dart';

class CardMenuButton extends StatefulWidget {

  final IconData icon;

  CardMenuButton({Key key, this.icon}) : super(key: key);

  _CardMenuButtonState createState() => _CardMenuButtonState();
}

class _CardMenuButtonState extends State<CardMenuButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: UIColors.offBlue,
      ),
      child: Icon(
        widget.icon,
        color: Colors.white,
      ),
    );
  }
}