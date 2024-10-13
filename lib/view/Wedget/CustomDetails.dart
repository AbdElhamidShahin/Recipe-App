import 'package:flutter/material.dart';
import 'package:recipes_app/view/Wedget/IconText_CustomDetails.dart';
import 'package:recipes_app/view/Wedget/Ingredients_Screen.dart';
import '../../model/articalmodel.dart';
import '../screens/StartCookingScreen.dart';

class CustomDetails extends StatelessWidget {
  final Recipe? articaleModel;
  final ArticleModel? articaleModeL;

  const CustomDetails({super.key, this.articaleModel, this.articaleModeL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الصورة الخلفية
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: BoxDecoration(),
              child: Image.network(
                articaleModeL?.image ?? 'assets/imagesFood/download.jpg',
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
          // النص فوق جزء محدد من الصورة
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            top: 200, // تعديل المسافة من الأسفل
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // خلفية بيضاء
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.all(20), // إضافة حواف داخلية
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // عنوان الوصفة والوصف
                    Text(
                      articaleModeL?.title ?? "Healthy Taco Salad",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "This healthy taco salad is the ultimate delight for taco lovers. A family favorite made with fresh ingredients.",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 10),
                    // تفاصيل السعرات، البروتينات، إلخ.
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconText(icon: Icons.eco_outlined, text: "${articaleModel?.nutrients.carbohydrates}g carbs"),
                            IconText(icon: Icons.eco_outlined, text: "${articaleModel?.nutrients.servings} servings"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconText(icon: Icons.balcony, text: "${articaleModel?.nutrients.protein}g proteins"),
                            Spacer(),
                            IconText(icon: Icons.food_bank, text: "${articaleModel?.nutrients.fat}g fats"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    // قائمة المكونات
                    Text(
                      "Ingredients",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),

                    // عرض المكونات الديناميكي
                    if (articaleModel?.ingredients != null && articaleModel!.ingredients!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: articaleModel!.ingredients!.map((ingredient) {
                          return Ingredients(
                            text1: ingredient.text, // Assuming ingredient has a text property
                            text2: ingredient.quantity != null ? '${ingredient.quantity} ${ingredient.measure}' : '', // Assuming ingredient has quantity and measure
                          );
                        }).toList(),
                      )
                    else
                      Text(
                        "ىخ ingredients available", // نص يظهر إذا لم توجد مكونات
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),

                    SizedBox(height: 20),
                    // زر "Start Cooking"
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StartCookingScreen()),
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
