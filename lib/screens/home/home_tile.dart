import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget{
  String imagePath;
  String text;
  HomeTile({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image.asset(imagePath),
        Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            color: Color(0x80000000),
            child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16),))
      ],
    );
  }
}