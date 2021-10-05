import 'package:flutter/material.dart';

import 'dart:developer';

import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  // static const routeName = '/category-meals';
  final String categoryId;
  final String categoryTitle;
  final Color color;

  const CategoryMealsScreen(this.categoryId, this.categoryTitle, this.color);

  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    // final categoryTitle = routeArgs['title'];
    // final categoryId = routeArgs['id'];

    // log('${categoryId} - ${categoryTitle}');

    final categoryMeals = getCategoryMealsToList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        // backgroundColor: color,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }

  List<Meal> getCategoryMealsToList() {
    return dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }
}
