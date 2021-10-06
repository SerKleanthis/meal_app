import 'package:flutter/material.dart';
import '../importing_all.dart';

class MealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final Color color;

  const MealsScreen(this.categoryId, this.categoryTitle, this.color);

  @override
  Widget build(BuildContext context) {
    final categoryMeals = getCategoryMealsToList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        // backgroundColor: color,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].iamgeUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
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
