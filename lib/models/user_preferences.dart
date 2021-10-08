import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;
  static const _lactose = 'lactose-free';
  static const _gluten = 'gluten-free';
  static const _vegan = 'vegan';
  static const _vegeterian = 'vegeterian';

  // Init
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  // Setters
  static Future setLactoseFree(bool value) async =>
      await _preferences.setBool(_lactose, value);

  static Future setGlutenFree(bool value) async =>
      await _preferences.setBool(_gluten, value);

  static Future setVegan(bool value) async =>
      await _preferences.setBool(_vegan, value);

  static Future setVegeterian(bool value) async =>
      await _preferences.setBool(_vegeterian, value);

  // Getters
  static bool isLactoseFree() => _preferences.getBool(_lactose) ?? false;

  static bool isGlutenFree() => _preferences.getBool(_gluten) ?? false;

  static bool isVegan() => _preferences.getBool(_vegan) ?? false;

  static bool isVegeterian() => _preferences.getBool(_vegeterian) ?? false;
}
