import 'package:flutter/material.dart';
import 'package:recipes_app/view/Wedget/IconText_CustomDetails.dart';
import 'package:recipes_app/view/Wedget/Ingredients_Screen.dart';
import '../../model/articalmodel.dart';
import '../screens/StartCookingScreen.dart';

class CustomDetails extends StatelessWidget {
  final ArticleModel? articleModel; // Keep only the relevant parameter

  const CustomDetails(
      {super.key, required this.articleModel}); // Make it required for clarity

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              child: Image.network(
                articleModel?.image ?? 'assets/imagesFood/download.jpg',
                height: 270,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/imagesFood/download.jpg',
                    height: 270,
                  );
                },
              ),
            ),
          ),
          // Text overlaid on a specific part of the image
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recipe title
                    SizedBox(height: 20,),
                    Text(
                      articleModel?.title ?? '',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconText(
                                icon: Icons.eco_outlined,
                                text:
                                    " ${articleModel?.carbohydrates.toStringAsFixed(2) ?? '0.00'}g Carbs"),
                            IconText(
                                icon: Icons.eco_outlined,
                                text:
                                    " ${articleModel?.servings.toStringAsFixed(2) ?? '0.00'} Proteins"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconText(
                                icon: Icons.balcony,
                                text:
                                    " ${articleModel?.protein.toStringAsFixed(2) ?? '0.00'}g Kcal"),
                            Spacer(),
                            IconText(
                                icon: Icons.food_bank,
                                text:
                                    " ${articleModel?.fat.toStringAsFixed(2) ?? '0.00'}g Fats"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Ingredients title
                    Text(
                      "Ingredients",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    if (articleModel?.ingredientLines != null &&
                        articleModel!.ingredientLines.isNotEmpty)
                      Container(
                        height: 220,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                articleModel!.ingredientLines.map((ingredient) {
                              return Ingredients(
                                text1:
                                    ingredient, // تأكد من أن ingredient هو نص
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
                    // "Start Cooking" button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 016),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartCookingScreen()),
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
        ],
      ),
    );
  }
}
