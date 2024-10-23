import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/view/screens/HomePage.dart';

import 'model/itemProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor:
              Color.fromRGBO(42, 45, 52, 1), // شفافية كاملة (بدون شفافية)

          selectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(color: Colors.white),
          unselectedItemColor: Colors.white,
          elevation: 5,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
