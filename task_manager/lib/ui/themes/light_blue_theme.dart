import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Color(0xff1f655d),
  accentColor: Color(0xff40bf7a),
  textTheme: TextTheme(
    title: TextStyle(
      color: Color(0xff40bf7a),
    ),
    subtitle: TextStyle(color: Colors.white),
    subhead: TextStyle(
      color: Color(0xff40bf7a),
    ),
  ),
  appBarTheme: AppBarTheme(
    color: Color(0xff1f655d),
  ),
);

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.orange,
  accentColor: Colors.cyan,
  textTheme: TextTheme(
    title: TextStyle(color: Colors.pink),
    subtitle: TextStyle(color: Colors.red),
    subhead: TextStyle(color: Colors.blue),
  ),
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.pink,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      subtitle: TextStyle(color: Colors.red),
      subhead: TextStyle(color: Colors.blue),
    ),
    color: Colors.green,
    actionsIconTheme: IconThemeData(color: Colors.brown),
  ),
);
