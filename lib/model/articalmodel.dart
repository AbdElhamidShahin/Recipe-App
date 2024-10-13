class ArticleModel {
  final String title;
  final String image;
  final List<String> ingredientLines;
  final double calories;  // Add this line
  final double fat;       // Add this line
  final double protein;   // Add this line
  final double carbohydrates;  // Add this line
  final int servings;     // Add this line

  ArticleModel({
    required this.title,
    required this.image,
    required this.ingredientLines,
    required this.calories,  // Include calories in the constructor
    required this.fat,       // Include fat in the constructor
    required this.protein,   // Include protein in the constructor
    required this.carbohydrates,  // Include carbohydrates in the constructor
    required this.servings,   // Include servings in the constructor
  });
}
