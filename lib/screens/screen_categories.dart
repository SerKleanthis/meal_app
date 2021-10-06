import 'package:flutter/material.dart';
import '../importing_all.dart';

class InitialScreen extends StatelessWidget {
  static String routeName = '/init';
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: dummyCategories
          .map((d) => CategoryItem(
                d.id,
                d.title,
                d.color,
              ))
          .toList(),
    );
  }
}
