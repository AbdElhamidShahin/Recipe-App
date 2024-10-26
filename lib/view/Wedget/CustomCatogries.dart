import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/articalmodel.dart';
import '../../model/itemProvider.dart';
import 'CustomDetails.dart';

class CustomCategories extends StatelessWidget {
  final Recipe? recipe;

  const CustomCategories({super.key, this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (recipe != null) {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => CustomDetails(recipe: recipe),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var sizeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic),
                );

                return SizeTransition(
                  sizeFactor: sizeAnimation,
                  axisAlignment: 0.0,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              transitionDuration: const Duration(milliseconds: 600),
            ),
          );
        }
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
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          recipe?.name ?? 'اسم غير متاح',
                          style: const TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Row(
                          children: [
                            Text(
                              '⏱ ${recipe?.nutrition.prepTime ?? 15} Mins',
                              style: const TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                if (recipe != null) {
                                  Provider.of<ItemProvider>(context, listen: false).addItem(recipe!);
                                }
                              },
                              icon: const Icon(Icons.favorite, size: 30),
                            ),
                          ],
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
            child: Hero(
              tag: recipe?.imageUrl ?? 'default-hero',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  recipe?.imageUrl ?? 'assets/imagesFood/download.png',
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/imagesFood/download.png',
                      height: 100,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
