import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String digit;
  final Function onClick;

  const CalculatorButton({super.key, required this.digit,
    required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: ElevatedButton(
              onPressed: () {
                onClick(digit);
              },
              child: Text(
                digit,
                style: const TextStyle(fontSize: 18),
              )),
        ));
  }
}
