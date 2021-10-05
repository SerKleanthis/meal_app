import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Colors.purple.shade400,
          primaryVariant: Colors.purple,
          secondary: Colors.amber.shade400,
          secondaryVariant: Colors.amber,
          surface: Colors.grey.shade200,
          background: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.black,
          brightness: Brightness.light,
        ),
        // colorScheme.: Colors.amber,
        fontFamily: 'Yaldevi',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Colors.black),
              bodyText2: const TextStyle(color: Colors.black),
              headline1: const TextStyle(
                fontSize: 20,
                fontFamily: 'Yaldevi',
              ),
            ),
      ),
      home: CategoriesScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
