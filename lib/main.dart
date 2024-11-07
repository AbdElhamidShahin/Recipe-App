import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/view/Login/LoginScreen.dart';
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
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xFFedefec),
        appBarTheme: const AppBarTheme(
          backgroundColor:Color(0xFFedefec),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system, // Automatic system-based theme switching
      home: const Loginscreen(),
    );
  }
}
