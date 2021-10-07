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
      theme: myThemeData(context),
      initialRoute: TabsScreen.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
