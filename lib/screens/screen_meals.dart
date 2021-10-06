import 'package:flutter/material.dart';
import '../importing_all.dart';

class MealsScreen extends StatelessWidget {
  static String routeName = '/meals';
  final String categoryId;
  final String categoryTitle;
  final Color color;

  const MealsScreen(this.categoryId, this.categoryTitle, this.color);

  @override
  Widget build(BuildContext context) {
    final mealsList = getCategoryMealsToList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        // backgroundColor: color,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meal: mealsList[index]);
        },
        itemCount: mealsList.length,
      ),
    );
  }

  List<Meal> getCategoryMealsToList() {
    return dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }
}
