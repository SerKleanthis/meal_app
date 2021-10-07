import 'package:flutter/material.dart';

ThemeData myThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: Colors.red.shade300,
    scaffoldBackgroundColor: Colors.amber.shade50,
    colorScheme: ColorScheme.light(
      primary: Colors.red.shade300,
      onPrimary: Colors.white,
      secondary: Colors.amber,
      error: Colors.red,
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(color: Colors.black),
          bodyText2: const TextStyle(color: Colors.white),
          headline1: const TextStyle(
            // for titles
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Yaldevi',
          ),
          headline2: const TextStyle(
            // for title in drawer
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 30,
            fontFamily: 'Yaldevi',
          ),
          headline3: const TextStyle(
            // for the drawer
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            fontFamily: 'Yaldevi',
          ),
          headline4: const TextStyle(
            // for the drawer
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w600,
            fontFamily: 'Yaldevi',
          ),
        ),
  );
}
