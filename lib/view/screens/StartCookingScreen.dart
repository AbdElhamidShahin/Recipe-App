import 'package:flutter/material.dart';

class StartCookingScreen extends StatelessWidget {
  const StartCookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Cooking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 250, // يمكنك تعديل الارتفاع حسب الحاجة
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                image: DecorationImage(
                  image: AssetImage('assets/imagesFood/download.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Steps to Cook:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            // يمكنك إضافة خطوات التحضير هنا
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Step 1: Gather your ingredients.'),
                  ),
                  ListTile(
                    title: Text('Step 2: Prepare the vegetables.'),
                  ),
                  ListTile(
                    title: Text('Step 3: Cook the meat.'),
                  ),
                  // يمكنك إضافة المزيد من الخطوات هنا
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // هنا يمكنك إضافة ما يحدث عند الضغط على الزر
              },
              child: Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
