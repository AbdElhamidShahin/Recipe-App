import 'package:flutter/material.dart';
import 'package:recipes_app/model/ImageUpper.dart';
import '../screens/StackScreen.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // عدد التابات
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Icon(Icons.search),
                ],
              ),
            ),
            const SizedBox(height: 28),
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
                'Fast Food.',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),

            // الـ TabBar
            Container(
              margin: const EdgeInsets.only(top: 0), // إزالة المسافة العلوية
              padding: EdgeInsets.zero, // إزالة أي Padding غير مطلوب
              child: const TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent, // إزالة الخط الفاصل السفلي
                indicatorSize: TabBarIndicatorSize.label, // تقليل حجم المؤشر إذا لزم الأمر
                labelPadding: EdgeInsets.symmetric(horizontal: 10.0), // تقليل المسافات بين التابات
                tabs: [
                  ImageUpper(
                    image: 'assets/TabBar_Image/Breakfast.png',
                    text: 'Electronics',
                  ),
                  ImageUpper(
                    image: 'assets/TabBar_Image/tasty-grilled-steak-on-white-600w-1167071881.webp',
                    text: 'Jewelry',
                  ),
                  ImageUpper(
                    image: 'assets/TabBar_Image/Sea Food.png',
                    text: 'Men',
                  ),
                  ImageUpper(
                    image: 'assets/TabBar_Image/Fast Food.jpeg',
                    text: 'Women',
                  ),
                  ImageUpper(
                    image: 'assets/TabBar_Image/Dessertsjpeg.png',
                    text: 'Women',
                  ),
                ],
              ),
            ),

            // المحتوى السفلي TabBarView
            Expanded(
              child: TabBarView(
                children: [
                  Stackscreen(),
                  Stackscreen(),
                  Stackscreen(),
                  Stackscreen(),
                  Stackscreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
