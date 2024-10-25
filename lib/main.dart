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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),

        // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //   elevation: 20.0,
        //   backgroundColor: Colors.black54,
        //   selectedItemColor: Colors.amber,
        //   unselectedItemColor: Colors.white54,
        //   selectedIconTheme: IconThemeData(color: Colors.amber, size: 30),
        //   unselectedIconTheme: IconThemeData(color: Colors.white54, size: 25),
        // ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.black,
          elevation: 20.0,
          selectedItemColor: Colors.amber,
          selectedIconTheme: IconThemeData(color: Colors.amber),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
