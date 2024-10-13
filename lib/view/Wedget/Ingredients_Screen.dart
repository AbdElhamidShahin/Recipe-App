import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({super.key, required this.text1, required this.text2});
final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                   text1,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Spacer(),
                  Text(
                    text2,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
