import 'package:flutter/material.dart';
import '../importing_all.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/details';
  final Meal meal;

  const MealDetailsScreen(this.meal);

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Image.network(
                meal.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            titledContainer(context, 'Ingredients'),
            buildContainer(
              context,
              LimitedBox(
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemBuilder: (ctx, index) => Card(
                    child: Text(
                      meal.ingredients[index],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  itemCount: meal.ingredients.length,
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
                        meal.steps[index],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    const Divider(),
                  ],
                ),
                itemCount: meal.steps.length,
              ),
            )

            // Stack(
            //   children: [
            //     // Positioned(
            //     //   bottom: 10,
            //     //   right: 10,
            //     //   child: Container(
            //     //     width: 300,
            //     //     color: Colors.black54,
            //     //     padding:
            //     //         const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            //     //     child: Text(
            //     //       meal.title,
            //     //       style: TextStyle(
            //     //         fontSize: 25,
            //     //         color: ThemeData().colorScheme.onPrimary,
            //     //       ),
            //     //       softWrap: true,
            //     //       overflow: TextOverflow.fade,
            //     //     ),
            //     //   ),
            //     // ),
            //   ],
            // ),
            // ListView.builder(itemBuilder: (ctx, index){
            //     return meal.imgredients[index];
            // })),
          ],
        ),
      ),
    );
  }
}
