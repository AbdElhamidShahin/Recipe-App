import 'package:flutter/material.dart';
import 'package:recipes_app/view/Wedget/IconText_CustomDetails.dart';
import 'package:recipes_app/view/Wedget/Ingredients_Screen.dart';
import '../../model/articalmodel.dart';
import '../screens/StartCookingScreen.dart';

class CustomDetails extends StatelessWidget {
  final Recipe? recipe; // Keep only the relevant parameter
  final Nutrition? nutrition; // Keep only the relevant parameter

  const CustomDetails(
      {super.key,
      required this.recipe,
      this.nutrition}); // Make it required for clarity

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromRGBO(42, 45, 52, 1), // شفافية كاملة (بدون شفافية)

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
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recipe title
                    SizedBox(
                      height: 120,
                    ),
                    Center(
                      child: Text(
                        recipe?.name ?? '',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconText(
                              text: "${recipe?.nutrition.prepTime} calories",
                              image: 'assets/imagesFood/timer.jpeg',
                            ),
                            IconText(
                              text: "${recipe?.nutrition.calories} calories",
                              image: 'assets/imagesFood/22.jpeg',
                            ),
                            IconText(
                              text: "${recipe?.nutrition.protein} ",
                              image: 'assets/imagesFood/star.jpeg',
                            ),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     IconText(
                        //         icon: Icons.balcony,
                        //         text:
                        //             " ${nutrition?.prepTime.toStringAsFixed(0) ?? '0.00'}g Kcal"),
                        //     Spacer(),
                        //     IconText(
                        //         icon: Icons.food_bank,
                        //         text:
                        //             " ${nutrition?.protein.toStringAsFixed(0) ?? '0.00'}g Fats"),
                        //   ],
                        // ),
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
                    if (recipe?.steps != null && recipe!.steps!.isNotEmpty)
                      Container(
                        height: 220,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: recipe!.ingredients.map((ingredient) {
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
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 460,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                recipe?.imageUrl ?? 'assets/imagesFood/download.png',
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/imagesFood/download.png',
                    height: 80,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
