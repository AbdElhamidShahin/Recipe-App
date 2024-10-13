import 'package:flutter/material.dart';
import '../../model/articalmodel.dart';
import '../../model/dio.dart';
import '../Wedget/CustomCatogries.dart';

class Stackscreen extends StatelessWidget {
  final RecipeService recipeService = RecipeService(); // تعريف recipeService
  final String keyword; // تعريف متغير keyword

  Stackscreen({super.key, required this.keyword}); // تأكد من تمرير keyword هنا

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('وصفات'),
      ),
      body: FutureBuilder<List<ArticleModel>>( // استخدام النوع الصحيح
        future: recipeService.fetchRecipes(keyword), // تمرير keyword هنا
        builder: (BuildContext context, AsyncSnapshot<List<ArticleModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('لا توجد وصفات متاحة'));
          }

          final recipes = snapshot.data!;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عدد الأعمدة
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 0.7,
            ),
            itemCount: recipes.length, // استخدام عدد الوصفات
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomCategories(
                  articaleModel: recipes[index], // استخدم الوصفة الصحيحة
                ),
              );
            },
          );
        },
      ),
    );
  }
}
