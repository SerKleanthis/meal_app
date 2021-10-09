import 'package:flutter/material.dart';
import '../importing_all.dart';

class FavoritesScreen extends StatefulWidget {
  static const routName = '/favorites';

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final List<String> favorites = UserPreferences.getFavorites() ?? [];
  List<Meal> mealsList = [];

  void getMealList() {
    for (var meal in dummyMeals) {
      if (favorites.contains(meal.id)) {
        mealsList.add(meal);
      }
    }
  }

  void _removeItem(String id) {
    setState(() {
      mealsList.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        getMealList();
        return MealItem(
          meal: mealsList[index],
          removeItem: _removeItem,
        );
      },
      //TODO: fix this, make it dynamic
      itemCount: favorites.length,
    );
  }
}
