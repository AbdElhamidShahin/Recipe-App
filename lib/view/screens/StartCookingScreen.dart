import 'package:flutter/material.dart';
import 'package:recipes_app/view/Wedget/IconText_CustomDetails.dart';
import 'package:recipes_app/view/Wedget/Ingredients_Screen.dart';
import '../../model/articalmodel.dart';

class StartCookingScreen extends StatelessWidget {
  final Recipe? recipe; // Keep only the relevant parameter
  final Nutrition? nutrition; // Keep only the relevant parameter

  const StartCookingScreen({
    super.key,
    required this.recipe,
    this.nutrition,
  }); // Make it required for clarity

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromRGBO(42, 45, 52, 1), // شفافية كاملة (بدون شفافية)
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 600,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 100, // حدد الارتفاع الذي تريده للصورة
                width: double.infinity, // عرض الصورة بكامل الشاشة
                child: Image.asset(
                  recipe?.imageUrl ?? 'assets/imagesFood/download.png',
                  fit: BoxFit.cover, // تعديل الحشو ليناسب الأبعاد
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/imagesFood/download.png',
                      fit: BoxFit.cover, // تأكد من ضبط الأبعاد هنا أيضاً
                    );
                  },
                ),
              ),
            ),
          ),

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
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      recipe?.name ?? '',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Text(
                        recipe?.description ?? '',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Colors.black54),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(

                      children: [

                        IconText(
                          text: "${recipe?.nutrition.calories} Kcal",
                          image: 'assets/imagesFood/22.jpeg',
                        ),
                        Spacer(),
                        IconText(
                          text: "${recipe?.nutrition.protein} Fats      ",
                          image: 'assets/imagesFood/star.jpeg',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconText(
                          text: "${recipe?.nutrition.calories} Carbs",
                          image: 'assets/imagesFood/22.jpeg',
                        ),
                        Spacer(),
                        IconText(
                          text: "${recipe?.nutrition.protein} Protine",
                          image: 'assets/imagesFood/star.jpeg',
                        ),
                      ],
                    ),
                    Text(
                      "Steps",
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
                            children: recipe!.steps.map((steps) {
                              return Ingredients(
                                text1: steps,
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
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          "End Recipe",
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
          // تعديل حجم الصورة والتحكم به
        ],
      ),
    );
  }
}
