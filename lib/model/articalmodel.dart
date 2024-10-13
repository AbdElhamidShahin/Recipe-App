
class ArticleModel {
  final String title;
  final String image;

  ArticleModel({required this.title, required this.image});
}
class Recipe {
  final String source; // Added source to keep track of where the recipe comes from
  final String url; // Added URL for the recipe
  final int yield; // Number of servings
  final List<String> healthLabels; // Health labels for dietary information
  final List<Ingredient> ingredients; // List of ingredients
  final Nutrients nutrients; // Nutritional information

  Recipe( {
    required this.source,
    required this.url,
    required this.yield,
    required this.healthLabels,
    required this.ingredients,
    required this.nutrients,
  });
}

class Ingredient {
  final String text; // Description of the ingredient
  final double? quantity; // Quantity of the ingredient
  final String? measure; // Measurement unit for the ingredient

  Ingredient({required this.text, this.quantity, this.measure});
}

class Nutrients {
  final double calories; // Total calories
  final double fat; // Total fat
  final double protein; // Total protein
  final double carbohydrates; // Total carbohydrates
  final int servings; // Number of servings

  Nutrients({
    required this.calories,
    required this.fat,
    required this.protein,
    required this.carbohydrates,
    required this.servings,
  });
}