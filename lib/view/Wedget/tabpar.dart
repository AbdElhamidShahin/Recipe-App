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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: <Widget>[
          ButtonsTabBar(
            unselectedBackgroundColor: Colors.white,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            height: 100,
            radius: 0, // لجعل الحواف مربعة
            buttonMargin: const EdgeInsets.symmetric(
                horizontal: 16.0), // المسافة بين كل تبويب
            tabs: [
              Tab(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(16)), // الحواف المربعة
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0), // لضبط المسافة داخل التبويب
                    child: CustomImage(
                        text: 'Steak',
                        image: 'assets/TabBar_Image/download.png'),
                  ),
                ),
              ),
              Tab(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomImage(
                        text: 'Desserts',
                        image: 'assets/TabBar_Image/Dessertsjpeg.png'),
                  ),
                ),
              ),
              Tab(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomImage(
                        text: 'Breakfast',
                        image: 'assets/TabBar_Image/download.png'),
                  ),
                ),
              ),
              Tab(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomImage(
                        text: 'Fast Food',
                        image: 'assets/TabBar_Image/download.png'),
                  ),
                ),
              ),
              Tab(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomImage(
                        text: 'Sea Food',
                        image: 'assets/TabBar_Image/Sea Food.png'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 600,
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
    );
  }
}
