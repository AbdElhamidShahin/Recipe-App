import 'package:flutter/material.dart';
import 'package:recipes_app/model/ImageUpper.dart';
import '../screens/StackScreen.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6, // عدد التابات
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: const Image(
                        width: 50,
                        height: 50,
                        image: NetworkImage(
                            'https://img.freepik.com/premium-vector/cute-boy-smiling-cartoon-kawaii-boy-illustration-boy-avatar-happy-kid_1001605-3447.jpg')),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Good food.',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Recipes Famous Food.',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // جعل التمرير أفقيًا
              child: Container(
                child: const TabBar(
                  isScrollable: true, // جعل التابات قابلة للتمرير
                  dividerHeight: 0,
                  indicatorColor:
                      Colors.transparent, // إزالة الخط الفاصل السفلي
                  labelPadding: EdgeInsets.symmetric(
                      horizontal: 8.0), // تقليل المسافات بين التابات
                  tabs: [
                    ImageUpper(
                      image: 'assets/food/BreakFast/images(2).png',
                      text: 'diner',
                    ),
                    ImageUpper(
                      image: 'assets/TabBar_Image/Breakfast.png',
                      text: 'breakfast',
                    ),
                    ImageUpper(
                      image: 'assets/TabBar_Image/Dessertsjpeg.png',
                      text: 'desserts',
                    ),
                    ImageUpper(
                      image: 'assets/TabBar_Image/Sea Food.png',
                      text: 'SeaFood',
                    ),
                    ImageUpper(
                      image: 'assets/images/burger.png',
                      text: 'FastFood',
                    ),
                    ImageUpper(
                      image:
                          'assets/food/Drinks/summer-drinks-fruits-png-6.png',
                      text: 'Drinks',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Popular now",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            // المحتوى السفلي TabBarView
            Expanded(
              child: TabBarView(
                children: [
                  StacksScreen(category: 'diner'),
                  StacksScreen(category: 'breakfast'),
                  StacksScreen(category: 'desserts'),
                  StacksScreen(category: 'SeaFood'),
                  StacksScreen(category: 'FastFood'),
                  StacksScreen(category: 'Drinks'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
