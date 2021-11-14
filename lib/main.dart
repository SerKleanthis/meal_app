import 'package:flutter/material.dart';
import 'importing_all.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten-free': false,
    'lactose-free': false,
    'vegan': false,
    'vegeterian': false,
  };

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
