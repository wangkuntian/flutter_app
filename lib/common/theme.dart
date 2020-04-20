import 'package:flutter/material.dart';

class LightGreen {
  static ThemeData theme() {
    return ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightGreen,
        primaryColor: Colors.lightGreen,
        primaryColorBrightness: Brightness.dark,
        accentColor: Colors.lightGreenAccent,
        accentColorBrightness: Brightness.dark,
    );
  }
}
