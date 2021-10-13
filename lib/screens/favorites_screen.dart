import 'package:flutter/material.dart';
import '../importing_all.dart';

class FavoritesScreen extends StatefulWidget {
  static const routName = '/favorites';

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  // final List<String> favorites = UserPreferences.getFavorites() ?? [];
  List<Meal> mealsList = [];

  @override
  void initState() {
    setState(() {
      mealsList = getMealsList();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      mealsList = getMealsList();
    });
    super.didChangeDependencies();
  }

  List<Meal> getMealsList() {
    List<Meal> updatedMealsList = [];
    for (var meal in dummyMeals) {
      if (UserPreferences.getFavorites()!.contains(meal.id)) {
        updatedMealsList.add(meal);
      }
    }
    return updatedMealsList;
  }

  void _removeItem(String id) {
    setState(() {
      List<String> favorites = UserPreferences.getFavorites() ?? [];
      favorites.removeWhere((element) => element == id);
      UserPreferences.setFavorites(favorites);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          meal: mealsList[index],
          removeItem: _removeItem,
        );
      },
      //TODO: fix this, make it dynamic
      itemCount: mealsList.length,
    );
  }
}
