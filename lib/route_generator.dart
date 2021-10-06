import 'package:flutter/material.dart';
import 'package:meal_app/screens/screen_categories.dart';
import 'package:meal_app/screens/screen_meals.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => InitialScreen());
      case '/meals':
        final args = settings.arguments as MealsScreen;
        if (args is MealsScreen) {
          return MaterialPageRoute(
            builder: (_) => MealsScreen(
              args.categoryId,
              args.categoryTitle,
              args.color,
            ),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
