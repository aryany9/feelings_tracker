import 'package:flutter/material.dart';

class Themes {
  static final lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        color: backgroundColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: accentColor,
      shadowColor: const Color(0xFFE7E7E8),
      buttonTheme: const ButtonThemeData(
        buttonColor: accentColor,
        textTheme: ButtonTextTheme.accent,
      ));
}

const backgroundColor = Color(0xFFF2F2F2);
const itemBackgroundColor = Color(0xFFF1F2F3);
const accentColor = Color(0xFF85C454);
