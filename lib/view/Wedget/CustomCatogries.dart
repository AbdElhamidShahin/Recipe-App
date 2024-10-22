import 'package:flutter/material.dart';
import '../../model/articalmodel.dart';
import 'CustomDetails.dart';

class CustomCategories extends StatelessWidget {
  final Recipe? recipe;

  const CustomCategories({super.key, this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomDetails(recipe: recipe),
          ),
        );
      },
      child: Stack(
        children: [
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          recipe?.name ?? 'اسم غير متاح',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                        const Text(
                          '⏱ 15 Mins',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ],
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
            bottom: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                recipe?.imageUrl ?? 'assets/imagesFood/download.png',
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/imagesFood/download.png',
                    height: 270,
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
