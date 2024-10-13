import 'package:flutter/material.dart';
import '../../model/articalmodel.dart';
import 'CustomDetails.dart';

class CustomCategories extends StatelessWidget {
  final ArticleModel? articaleModel;

  const CustomCategories({super.key, this.articaleModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // تأكد من أنك تستدعي CustomDetails وليس CustomCategories هنا
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomDetails(
           articleModel: articaleModel, // تمرير articaleModel إلى CustomDetails
            ),
          ),
        );

      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child:
                 Image.network(
              articaleModel!.image!,
              height: 270,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/imagesFood/download.jpg',
                  height: 270,
                );
              },
            )

          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black54,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        articaleModel?.title ?? 'اسم غير متاح',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Text(
                  articaleModel?.title ?? 'اسم غير متاح',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const Text(
                  '⏱ 15 دقيقة',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
