import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
    mealsList = getCategoryMealsToList();
    super.didChangeDependencies();
  }

  Widget emptyList(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Lottie.asset('assets/images/plate.json',
              height: MediaQuery.of(context).size.height),
          Positioned(
            bottom: 160,
            child: Text(
              'It\'s Empty',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }

  List<Meal> getCategoryMealsToList() {
    return dummyMeals.where((meal) {
      return meal.categories.contains(widget.categoryId);
    }).toList();
  }

  void _removeItem(String id) {
    setState(() {
      mealsList!.removeWhere((meal) => meal.id == id);
    });
  }
}
