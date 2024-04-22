import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.purple,
  Colors.pink,
  Colors.yellow,
  Colors.grey
];
class AppTheme {

  final int selectedColor;
  final bool darkMode;

  AppTheme({
    this.darkMode = false,
    this.selectedColor = 0
  }):assert( selectedColor >= 0, 'Selected color must be greated more than 0' );
  
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: darkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    )
  );
}