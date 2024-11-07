import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/model/itemProvider.dart';
import 'package:recipes_app/view/Wedget/IconText_CustomDetails.dart';
import 'package:recipes_app/view/Wedget/Ingredients_Screen.dart';
import '../../model/articalmodel.dart';
import '../screens/StartCookingScreen.dart';

class CustomDetails extends StatefulWidget {
  final Recipe? recipe;
  final Nutrition? nutrition;

  const CustomDetails({
    super.key,
    required this.recipe,
    this.nutrition,
  });

  @override
  State<CustomDetails> createState() => _CustomDetailsState();
}

class _CustomDetailsState extends State<CustomDetails> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Adjusted target screen if you want to navigate to a different page.
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(42, 45, 52, 1),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 120),
                      Center(
                        child: Text(
                          widget.recipe?.name ?? '',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconText(
                            text: "${widget.recipe?.nutrition?.prepTime} min",
                            image: 'assets/imagesFood/timer.png',
                          ),
                          IconText(
                            text:
                                "${widget.recipe?.nutrition?.calories} calories",
                            image: 'assets/imagesFood/22.png',
                          ),
                          IconText(
                            text: "${widget.recipe?.nutrition?.protein} ",
                            image: 'assets/imagesFood/star.jpeg',
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Ingredients",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      if (widget.recipe?.steps != null &&
                          widget.recipe!.steps!.isNotEmpty)
                        Container(
                          height: 220,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  widget.recipe!.ingredients.map((ingredient) {
                                return Ingredients(text1: ingredient);
                              }).toList(),
                            ),
                          ),
                        )
                      else
                        Text(
                          "لا توجد مكونات متاحة",
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2F2D2F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      StartCookingScreen(recipe: widget.recipe),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var scaleAnimation = Tween<double>(
                                  begin: 0.5,
                                  end: 1.0,
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
                        child: const Center(
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
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(16)),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: Hero(
                    tag: widget.recipe?.imageUrl ?? 'default-hero',
                    child: Image.asset(
                      widget.recipe?.imageUrl ??
                          'assets/imagesFood/download.png',
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
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF333331),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,)),
                    ),
                  ),
                  Spacer(),
                  _buildFavoriteIcon(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteIcon() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              setState(() {
                widget.recipe!.isFavorite = !widget.recipe!.isFavorite;
              });
              if (widget.recipe != null) {
                Provider.of<ItemProvider>(context, listen: false)
                    .addItem(widget.recipe!);
              }
            },
            icon: Icon(
              widget.recipe!.isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 30,
              color: widget.recipe!.isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
