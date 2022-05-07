// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  scaffoldBackgroundColor: Colors.grey[800],
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey[800],
        statusBarIconBrightness: Brightness.light),
    backgroundColor: Colors.grey[800],
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepPurpleAccent,
    unselectedItemColor: Colors.grey,
    elevation: 50.0,
    backgroundColor: Colors.grey[800],
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  fontFamily: 'Jannah',
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: defaultColor,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: defaultColor,
        statusBarIconBrightness: Brightness.dark),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: defaultColor,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor ,
    elevation: 50.0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  fontFamily: 'Jannah',
);