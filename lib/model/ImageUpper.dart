import 'package:flutter/material.dart';

class ImageUpper extends StatelessWidget {
  final String image;
  final String text;

  const ImageUpper({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(image),
          ),
        ),
        const SizedBox(height: 8), // مسافة بين الصورة والنص
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
