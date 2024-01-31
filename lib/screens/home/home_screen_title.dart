import 'package:flutter/material.dart';

class HomeScreenTitle extends StatelessWidget {
  String text;
  HomeScreenTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 18),
          color: Colors.purple,
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18))),
    );
  }
}