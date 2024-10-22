import 'package:flutter/material.dart';
import 'package:recipes_app/model/articalmodel.dart';

import '../../model/JsonScrren.dart';
import '../Wedget/CustomCatogries.dart';

class Stackscreen extends StatelessWidget {
  final Recipe? recipe;

  Stackscreen({super.key, this.recipe});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
      future: fetchRecipeFromJson(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No recipes found'));
        }

        final List<Recipe> recipes = snapshot.data!;

        return Scaffold(
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomCategories(
                  recipe: recipes[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
