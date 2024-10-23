import 'dart:convert';

import 'package:flutter/services.dart';

class Recipe {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  final List<String> ingredients;
  final List<String> steps;
  final Nutrition nutrition;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.nutrition,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      ingredients: List<String>.from(json['ingredients']),
      steps: List<String>.from(json['steps']),
      nutrition: Nutrition.fromJson(json['nutrition']),

    );
  }  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
      'steps': steps,
    };
  }
}

class Nutrition {
  final int calories;
  final int protein;
  final int prepTime;

  Nutrition({
    required this.calories,
    required this.protein,
    required this.prepTime,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      calories: json['calories'],
      protein: json['protein'],
      prepTime: json['prepTime'],
    );
  }
}

// دالة لتحميل البيانات من JSON
Future<List<Recipe>> fetchRecipes() async {
  final String response = await rootBundle.loadString('assets/recipes.json');
  final data = json.decode(response) as List<dynamic>;

  return data.map((json) => Recipe.fromJson(json)).toList();
}
