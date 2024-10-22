import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'articalmodel.dart';

Future<List<Recipe>> fetchRecipeFromJson(BuildContext context) async {
  try {
    final String response = await rootBundle.loadString('assets/Recipe/recipe.json');
    final data = json.decode(response) as List<dynamic>;

    // اطبع عدد العناصر التي تم الحصول عليها
    print("Fetched ${data.length} recipes");

    List<Recipe> recipe = data.map((json) {
      print("Recipe ID: ${json['id']}"); // اطبع كل معرّف لوصفة
      return Recipe.fromJson(json);
    }).toList();

    return recipe;
  } catch (e) {
    print("Error fetching recipes: $e"); // اطبع الخطأ
    throw e; // إعادة رمي الخطأ للتعامل معه في مكان أعلى
  }
}
