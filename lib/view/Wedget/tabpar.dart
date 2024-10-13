import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../screens/StackScreen.dart';
import 'CustomImage.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {    final String keyword = 'مثال'; // أو يمكنك الحصول عليها من مكان آخر مثل نموذج

  return DefaultTabController(
      length: 5,
      child: Column(
        children: <Widget>[
          ButtonsTabBar(
            backgroundColor: Color(0xFFEEEEEE),
            unselectedBackgroundColor:  Colors.white,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            height: 100,
            radius: 100,
            tabs: const [
              Tab(
                child: CustomImage(
                    text: 'Steak', image: 'assets/TabBar_Image/tasty-grilled-steak-on-white-600w-1167071881.webp'),
              ),
              Tab(
                child: CustomImage(
                    text: 'Desserts', image: 'assets/TabBar_Image/cherry-dessert-white-background-nobody-birthday-celebration-bright-cupcake-dessert-whipped-cream-cherry-112153178.webp'),
              ),
              Tab(
                child: CustomImage(
                    text: 'Breakfast', image: 'assets/TabBar_Image/360_F_246169236_XndijzYiPUZmE5C8aZM9ee7wdvPD9WbX.webp'),
              ),
              Tab(
                child: CustomImage(
                    text: 'Fast Food', image: 'assets/TabBar_Image/images.webp'),
              ),
              Tab(
                child: CustomImage(
                    text: 'Sea Food', image: 'assets/TabBar_Image/pngtree-grilled-assortment-of-seafood-on-white-background-with-png-image_11086251.png'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: TabBarView(
              children: [
                Stackscreen(keyword: 'keyword',),
                Stackscreen(keyword: 'keyword',),
                Stackscreen(keyword: 'keyword',),

                Stackscreen(keyword: 'keyword',),

                Stackscreen(keyword: 'keyword',),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
