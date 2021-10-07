import 'package:flutter/material.dart';
import 'package:meal_app/importing_all.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function handler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: handler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            Container(
              // color: Theme.of(context).colorScheme.primary,
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: Text(
                'Cooking Up!',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(
                Icons.restaurant,
                size: 26,
              ),
              title: Text(
                'Meals',
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(TabsScreen.routeName),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                size: 26,
              ),
              title: Text(
                'Settings',
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
