import 'package:flutter/material.dart';
import 'package:sun_basics_flutter/screens/calculator/calculator.dart';
import 'package:sun_basics_flutter/screens/home/home_screen.dart';
import 'package:sun_basics_flutter/screens/login/login.dart';
import 'package:sun_basics_flutter/screens/register/register_screen.dart';
import 'package:sun_basics_flutter/screens/xo/game_board.dart';
import 'package:sun_basics_flutter/screens/xo/splash.dart';

void main() {
  runApp(MyApp());
}
// test commit from git hub
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basics",
      routes: {
        "home": (_) {
          return HomeScreen();
        },
        "login": (_) => LoginScreen(),
        "register": (_) => RegisterScreen(),
        CalculatorScreen.routeName: (_) => CalculatorScreen(),
        GameBoard.routeName: (_) => GameBoard(),
        Splash.routeName: (_) => Splash()
      },
      initialRoute: Splash.routeName,
    );
  }

}
