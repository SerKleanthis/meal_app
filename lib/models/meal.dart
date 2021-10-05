enum Complexity { simple, challenging, hard }

enum Affordability { affordable, pricey, luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String iamgeUrl;
  final List<String> imgredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGluttenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegeterian;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.iamgeUrl,
    required this.imgredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGluttenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegeterian,
  });
}
