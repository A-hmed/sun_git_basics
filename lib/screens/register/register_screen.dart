import 'package:flutter/material.dart';
import 'package:sun_basics_flutter/screens/calculator/calculator.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.pushReplacementNamed(context,
                CalculatorScreen.routeName);
          }, child: Text("Home screen")),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Login screen"))
        ],
      ),
    );
  }
}
