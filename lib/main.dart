import 'package:flutter/material.dart';
import 'importing_all.dart';

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
          primary: Colors.red.shade300,
          primaryVariant: Colors.red.shade500,
          secondary: Colors.red.shade500,
          secondaryVariant: Colors.red.shade700,
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
        // backgroundColor: Colors.amber,
        scaffoldBackgroundColor: Colors.amber.shade50,
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
      // home: CategoriesScreen(),
      initialRoute: InitialScreen.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
