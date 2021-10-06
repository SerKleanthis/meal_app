enum Complexity { simple, challenging, hard }

enum Affordability { affordable, pricey, luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
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
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGluttenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegeterian,
  });

  // Complexity to string Getter
  String get getComplexityToString {
    String complexityToString = 'Unknown';

    switch (complexity) {
      case Complexity.simple:
        complexityToString = 'Simple';
        break;
      case Complexity.challenging:
        complexityToString = 'Challenging';
        break;
      case Complexity.hard:
        complexityToString = 'hard';
        break;
    }
    return complexityToString;
  }

  // Affordability to string Getter
  String get getAffordabilityToString {
    String affordabilityToString = 'Unknown';

    switch (affordability) {
      case Affordability.affordable:
        affordabilityToString = 'Affordable';
        break;
      case Affordability.pricey:
        affordabilityToString = 'Pricey';
        break;
      case Affordability.luxurious:
        affordabilityToString = 'Luxurious';
        break;
    }
    return affordabilityToString;
  }
}
