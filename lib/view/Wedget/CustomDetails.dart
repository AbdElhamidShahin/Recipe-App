import 'package:flutter/material.dart';
import 'package:recipes_app/view/Wedget/IconText_CustomDetails.dart';
import 'package:recipes_app/view/Wedget/Ingredients_Screen.dart';
import '../../model/articalmodel.dart';
import '../screens/StartCookingScreen.dart';

class CustomDetails extends StatelessWidget {
  final Recipe? recipe;
  final Nutrition? nutrition;

  const CustomDetails({
    super.key,
    required this.recipe,
    this.nutrition,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(42, 45, 52, 1),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 120),
                    Center(
                      child: Text(
                        recipe?.name ?? '',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconText(
                          text: "${recipe?.nutrition.prepTime} min",
                          image: 'assets/imagesFood/timer.jpeg',
                        ),
                        IconText(
                          text: "${recipe?.nutrition.calories} calories",
                          image: 'assets/imagesFood/22.jpeg',
                        ),
                        IconText(
                          text: "${recipe?.nutrition.protein} g",
                          image: 'assets/imagesFood/star.jpeg',
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Ingredients",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    if (recipe?.steps != null && recipe!.steps!.isNotEmpty)
                      Container(
                        height: 220,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: recipe!.ingredients.map((ingredient) {
                              return Ingredients(
                                text1: ingredient,
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    else
                      Text(
                        "لا توجد مكونات متاحة",
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => StartCookingScreen(recipe: recipe),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              var scaleAnimation = Tween<double>(
                                begin: 0.5, // بداية التكبير
                                end: 1.0, // النهاية
                              ).animate(CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeInOut,
                              ));

                              var fadeAnimation = Tween<double>(
                                begin: 0.0,
                                end: 1.0,
                              ).animate(CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeInOut,
                              ));

                              return ScaleTransition(
                                scale: scaleAnimation,
                                child: FadeTransition(
                                  opacity: fadeAnimation,
                                  child: child,
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          "Start Cooking",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 460,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
              child: Container(
                height: 100,
                width: double.infinity,
                child: Hero(
                  tag: recipe?.imageUrl ?? 'default-hero',
                  child: Image.asset(
                    recipe?.imageUrl ?? 'assets/imagesFood/download.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/imagesFood/download.png',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
