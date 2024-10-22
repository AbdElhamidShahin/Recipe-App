import 'package:flutter/material.dart';

import '../Wedget/tabpar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Food,groceries',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon:
                    Icon(Icons.search_rounded, size: 42, color: Colors.black),
              ),
              style: TextStyle(color: Colors.black), // هنا يمكنك تغيير اللون
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TabBarPage(),
        ],
      ),
    ));
  }
}
