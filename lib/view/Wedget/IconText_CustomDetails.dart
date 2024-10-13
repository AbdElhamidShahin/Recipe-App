
// مثال على IconText و IngredientItem
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  IconText({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                size: 28,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 4),
          Text(text, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
