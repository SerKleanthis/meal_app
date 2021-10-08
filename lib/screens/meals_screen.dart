import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:developer';
import '../importing_all.dart';

class MealsScreen extends StatefulWidget {
  static const routeName = '/meals';
  final String categoryId;
  final String categoryTitle;
  final Color color;

  const MealsScreen(this.categoryId, this.categoryTitle, this.color);

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  List<Meal>? mealsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle),
        // backgroundColor: color,
      ),
      body: mealsList!.isEmpty
          ? emptyList(context)
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(
                  meal: mealsList![index],
                  removeItem: _removeItem,
                );
              },
              itemCount: mealsList!.length,
            ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    mealsList = getMealsList();
    super.didChangeDependencies();
  }

  Widget emptyList(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      child: Column(
        children: [
          LimitedBox(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
            child: Lottie.asset('assets/images/plate.json'),
          ),
          Text(
            'It\'s Empty',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  List<Meal>? getMealsList() {
    List<Meal> mealsList = dummyMeals
        .where((meal) => meal.categories.contains(widget.categoryId))
        .toList();
    var toRemove = [];

    for (var meal in mealsList) {
      log('${meal.isLactoseFree} - ${UserPreferences.isLactoseFree().toString()}');

      if (UserPreferences.isLactoseFree()) {
        if (!meal.isLactoseFree) {
          setState(() {
            toRemove.add(meal);
          });
        }
      }

      if (UserPreferences.isGlutenFree()) {
        if (!meal.isGluttenFree) {
          setState(() {
            if (!toRemove.contains(meal)) {
              toRemove.add(meal);
            }
          });
        }
      }

      if (UserPreferences.isVegan()) {
        if (!meal.isVegan) {
          setState(() {
            if (!toRemove.contains(meal)) {
              toRemove.add(meal);
            }
          });
        }
      }

      if (UserPreferences.isVegeterian()) {
        if (!meal.isVegeterian) {
          setState(() {
            if (!toRemove.contains(meal)) {
              toRemove.add(meal);
            }
          });
        }
      }
    }

    mealsList.removeWhere((element) => toRemove.contains(element));
    return mealsList;
  }

  void _removeItem(String id) {
    setState(() {
      mealsList!.removeWhere((meal) => meal.id == id);
    });
  }
}
