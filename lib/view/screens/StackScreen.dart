import 'package:flutter/material.dart';
import 'package:recipes_app/model/articalmodel.dart';
import 'package:redacted/redacted.dart'; // تأكد من استيراد الحزمة
import '../../model/JsonScrren.dart';
import '../Wedget/CustomCatogries.dart';

class StacksScreen extends StatefulWidget {
  final String category;

  StacksScreen({super.key, required this.category});

  @override
  State<StacksScreen> createState() => _StacksScreenState();
}

class _StacksScreenState extends State<StacksScreen> {
  bool isDelayed = false; // لتتبع إذا تم تأخير 3 ثواني

  @override
  void initState() {
    super.initState();
    // تأخير لمدة 3 ثواني
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isDelayed = true; // بعد 3 ثواني يتم تغيير الحالة
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, List<Recipe>>>(
      future: fetchRecipeFromJson(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {

        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No recipes found'));
        }

        final items = snapshot.data![widget.category] ?? [];

        return Scaffold(
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomCategories(
                  recipe: items[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
