import 'package:flutter/material.dart';
import 'package:recipes_app/model/articalmodel.dart';
import '../../model/JsonScrren.dart';
import '../Wedget/CustomCatogries.dart';

class StacksScreen extends StatelessWidget {
  final String category;

  StacksScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, List<Recipe>>>(
      future: fetchRecipeFromJson(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No recipes found'));
        }

        final items = snapshot.data![category] ?? [];

        return Scaffold(
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomCategories(
                  recipe: items[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
