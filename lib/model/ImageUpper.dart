import 'package:flutter/material.dart';

class ImageUpper extends StatelessWidget {
  final String image;
  final String text;

  const ImageUpper({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 60,
            height: 60,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(image),
            ),
          ),
        ),
        const SizedBox(height: 8), // مسافة بين الصورة والنص
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
     SizedBox(width: 50,),
      ],
    );
  }
}
