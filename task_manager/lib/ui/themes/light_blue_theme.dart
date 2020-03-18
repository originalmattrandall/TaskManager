import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Color(0xff3c3c3c),
  accentColor: Colors.lightBlue,
  backgroundColor: Colors.lightBlue,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.lightBlue),
    hintStyle: TextStyle(color: Colors.lightBlue[300]),
    enabledBorder: lightUnderLineBorder,
    focusedBorder: lightUnderLineBorder,
    errorBorder: lightUnderLineBorder,
    focusedErrorBorder: lightUnderLineBorder,
  ),
  hintColor: Colors.lightBlue[100],
  textTheme: TextTheme(
    body1: TextStyle(
      color: Colors.lightBlue,
    ),
    subhead: TextStyle(
      color: Colors.lightBlue,
    ),
  ),
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
    color: Color(0xff121212),
  ),
  scaffoldBackgroundColor: Color(0xff121212),
  iconTheme: IconThemeData(
    color: Colors.lightBlue,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 0,
  ),
);

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.lightBlue,
  accentColor: Colors.lightBlue[300],
  backgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.lightBlue),
    hintStyle: TextStyle(color: Colors.lightBlue[300]),
    enabledBorder: lightUnderLineBorder,
    focusedBorder: lightUnderLineBorder,
    errorBorder: lightUnderLineBorder,
    focusedErrorBorder: lightUnderLineBorder,
  ),
  hintColor: Colors.lightBlue[100],
  textTheme: TextTheme(
    body1: TextStyle(
      color: Colors.lightBlue,
    ),
    subhead: TextStyle(
      color: Colors.lightBlue,
    ),
  ),
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
    color: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 2,
  ),
);

var lightUnderLineBorder = UnderlineInputBorder(
    borderSide: BorderSide(
  color: Colors.lightBlue,
));
