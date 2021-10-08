import 'package:flutter/material.dart';
import 'package:meal_app/importing_all.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegeterian = false;

  @override
  void initState() {
    _isGlutenFree = UserPreferences.isGlutenFree();
    _isLactoseFree = UserPreferences.isLactoseFree();
    _isVegan = UserPreferences.isVegan();
    _isVegeterian = UserPreferences.isVegeterian();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Glutten Free'),
                  value: _isGlutenFree,
                  subtitle: Text('Include only gluten-free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                      UserPreferences.setGlutenFree(newValue);
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose Free'),
                  value: _isLactoseFree,
                  subtitle: Text('Include only lactose-free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                      UserPreferences.setLactoseFree(newValue);
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  value: _isVegan,
                  subtitle: Text('Include only vegan meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _isVegan = newValue;
                      UserPreferences.setVegan(newValue);
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegeterian'),
                  value: _isVegeterian,
                  subtitle: Text('Include only Vegeterian meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _isVegeterian = newValue;
                      UserPreferences.setVegeterian(newValue);
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void saveFilters() {}
}
