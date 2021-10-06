import 'package:flutter/material.dart';
import 'package:meal_app/screens/screen_meal_details.dart';
import '../importing_all.dart';

class MealItem extends StatelessWidget {
  // final String title;
  // final String imageUrl;
  // final int duration;
  // final Complexity complexity;
  // final Affordability affordability;
  final Meal meal;

  const MealItem({required this.meal
      // required this.title,
      // required this.imageUrl,
      // required this.duration,
      // required this.complexity,
      // required this.affordability,
      });

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailsScreen.routeName, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 25,
                        color: ThemeData().colorScheme.onPrimary,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text('${meal.duration.toString()}\' mins'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 6),
                      // ignore: unnecessary_string_interpolations
                      Text('${meal.getComplexityToString}'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.euro),
                      const SizedBox(width: 6),
                      // ignore: unnecessary_string_interpolations
                      Text('${meal.getAffordabilityToString}'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
