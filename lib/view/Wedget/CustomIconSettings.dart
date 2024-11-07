
import 'package:flutter/material.dart';

class CustomIconSettings extends StatelessWidget {
  const CustomIconSettings(
      {super.key, required this.text, required this.image, this.icon});
  final String text;

  final String image;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Image(
            image: AssetImage(image),
            width: 40,
            height: 40,
          ),
          SizedBox(
            width: 6,
          ),
          Column(
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(icon),
              ),
            ),
          )
        ],
      ),
    );
  }
}
