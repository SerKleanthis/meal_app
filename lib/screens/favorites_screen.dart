import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  static const routName = '/favorites';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Card(
        elevation: 10,
        margin: EdgeInsets.all(34),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            Column(
              children: [
                Text(
                  'Ena',
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  'Dyo',
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  'tria',
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
