import 'dart:developer';

import 'package:flutter/material.dart';
import '../importing_all.dart';

class MealDetailsScreen extends StatefulWidget {
  static const routeName = '/details';
  final Meal meal;

  const MealDetailsScreen(this.meal);

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
      ),
      // height: 200,
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: child,
    );
  }

  Widget titledContainer(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void updateFavorites(String mealId) {
    // Get favorites
    List<String> favorites = UserPreferences.getFavorites() ?? [];
    bool isFavorite = false;

    // Check if exists or not
    setState(() {
      if (favorites.contains(widget.meal.id)) {
        favorites.remove(mealId);
        isFavorite = false;
      } else {
        favorites.add(mealId);
        isFavorite = true;
      }
    });

    // Initilize snackbar and sets the message
    final snackBar = SnackBar(
      content: isFavorite
          ? const Text('Added to Favorites')
          : const Text('Removed from Favorites'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),
    );

    // Update user preferences favorites list and shows message
    UserPreferences.setFavorites(favorites.toSet().toList());
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    log('${UserPreferences.getFavorites()!.length}');
  }

  // Return true if the meal is already in favorites else false
  bool isInTheFavorites() {
    List<String> favorites = UserPreferences.getFavorites() ?? [];

    return favorites.contains(widget.meal.id);
  }

  Widget ingredientsContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
      ),
      height: widget.meal.ingredients.length * 20 + 90,
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.meal.ingredients.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              const Icon(Icons.adjust), //FIXME
              const SizedBox(width: 20),
              Text(widget.meal.ingredients[index]),
            ],
          ),
        ),
      ),
    );
  }

  Widget stepsContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
      ),
      height: widget.meal.steps.length * 20 + 70,
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.meal.steps.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Text('${index + 1}'), //FIXME
              const SizedBox(width: 20),
              Expanded(child: Text(widget.meal.steps[index])),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  child: Hero(
                    tag: widget.meal.id,
                    child: Image.network(
                      widget.meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            //TODO add the fileters, time, dificulty etc
            titledContainer(context, 'Ingredients:'),
            ingredientsContainer(),
            titledContainer(context, 'Steps:'),
            stepsContainer(),
            const SizedBox(height: 30)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () => Navigator.of(context).pop(widget.meal.id),
      ),
    );
  }
}
