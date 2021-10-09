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
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
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
                  child: Image.network(
                    widget.meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  height: 15,
                  right: 15,
                  child: IconButton(
                    icon: !isInTheFavorites()
                        ? const Icon(Icons.star_outline)
                        : const Icon(Icons.star_outlined),
                    onPressed: () => updateFavorites(widget.meal.id),
                  ),
                ),
              ],
            ),
            titledContainer(context, 'Ingredients'),
            buildContainer(
              context,
              LimitedBox(
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemBuilder: (ctx, index) => Card(
                    child: Text(
                      widget.meal.ingredients[index],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  itemCount: widget.meal.ingredients.length,
                ),
              ),
            ),
            titledContainer(context, 'Steps'),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)} '),
                      ),
                      title: Text(
                        widget.meal.steps[index],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    const Divider(),
                  ],
                ),
                itemCount: widget.meal.steps.length,
              ),
            ),
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
