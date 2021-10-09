import 'package:flutter/material.dart';
import '../importing_all.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text(
          'Settings screen is empty',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
